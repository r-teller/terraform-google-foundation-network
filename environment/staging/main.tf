locals {
  project_id          = "rteller-demo-host-aaaa"
  prefix              = "ngfw-poc"
  environment         = "prod"
  network_config_path = "./networks"
  network_config_sets = fileset(local.network_config_path, "*.json")
  network_configs = flatten([for networks in local.network_config_sets : [
    for network in jsondecode(file("${local.network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])

  shared_firewall_rules_path = "./shared_firewall_rules"
  shared_firewall_rules_sets = fileset(local.shared_firewall_rules_path, "*.json")
  shared_firewall_rules = flatten([for rules in local.shared_firewall_rules_sets : [
    for rule in jsondecode(file("${local.shared_firewall_rules_path}/${rules}")) :
    merge(rule, { fileName = split(".", rules)[0] })
  ]])

  shared_network_firewall_rule_map = merge([for key, value in local.networks : {
    for rule in local.shared_firewall_rules : "${rule.fileName}-${key}-${rule.id}" => merge(rule, { network = key })
  }]...)


  networks = { for network in local.network_configs : "${local.prefix}-${local.environment}-vpc-${network.name}" => {
    routing_mode            = network.routing_mode
    mtu                     = 1460
    auto_create_subnetworks = false
  } }

  cloud_nat = merge(flatten([
    for network in local.network_configs : {
      for region in keys(network.subnetworks) : "${local.prefix}-${local.environment}-${network.name}-${region}-router" => {
        name    = "${local.prefix}-${local.environment}-${network.name}-${region}-router",
        region  = region,
        network = "${local.prefix}-${local.environment}-vpc-${network.name}",
      } if 0 < length(regexall("outside", network.name))
    }
  ])...)

  subnetworks = merge(flatten([
    for network in local.network_configs : [
      for region, subnetwork in network.subnetworks : {
        for key, value in subnetwork : "${network.name}-${region}-${key}" => merge(
          value, {
            name    = "${local.prefix}-${local.environment}-${network.name}-subnet-${replace(value.ip_cidr_range, "//|\\./", "-")}"
            network = "${local.prefix}-${local.environment}-vpc-${network.name}",
            region  = region
          }
        )
      }
    ]
  ])...)

  firewall_rules = merge([
    for network in local.network_configs : {
      for firewall_rule in network.firewall_rules : "${local.prefix}--${local.environment}--${network.name}--${firewall_rule.id}" => merge(
        firewall_rule, {
          fileName = "rule"
          network  = "${local.prefix}-${local.environment}-vpc-${network.name}",
        }
      )
    }
  ]...)

  routes = merge([
    for network in local.network_configs : {
      for route in network.routes : "${local.prefix}--${local.environment}--${network.name}--${route.name}" => merge(
        route, {
          network  = "${local.prefix}-${local.environment}-vpc-${network.name}",
          priority = can(route.priority) ? route.priority : 1000
          tags     = can(route.tags) ? route.tags : []
        }
      )
    }
  ]...)
}

module "utils" {
  source  = "terraform-google-modules/utils/google"
  version = "~> 0.3"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "network" {
  project                         = local.project_id
  for_each                        = local.networks
  name                            = each.key
  auto_create_subnetworks         = each.value.auto_create_subnetworks
  mtu                             = each.value.mtu
  routing_mode                    = each.value.routing_mode
  delete_default_routes_on_create = true
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  project  = local.project_id
  for_each = local.cloud_nat

  name    = each.value.name
  network = each.value.network
  region  = each.value.region

  depends_on = [
    google_compute_network.network
  ]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "nat" {
  for_each                           = google_compute_router.router
  name                               = "${each.value.name}-nat"
  router                             = each.value.name
  region                             = each.value.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_route" "route_next_hop_gateway" {
  for_each         = { for key, route in local.routes : key => route if can(route.next_hop_gateway) }
  name             = each.value.name
  network          = each.value.network
  dest_range       = each.value.dest_range
  next_hop_gateway = each.value.next_hop_gateway
  priority         = each.value.priority

  depends_on = [
    google_compute_network.network
  ]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "subnetwork" {
  project  = local.project_id
  for_each = local.subnetworks

  name          = each.value.name
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = each.value.network
  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ranges
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  depends_on = [
    google_compute_network.network
  ]
}

module "shared_firewall_rules" {
  source   = "r-teller/firewall-rules/google"
  for_each = local.shared_network_firewall_rule_map

  project_id = local.project_id
  network    = each.value.network

  firewall_rule = each.value

  depends_on = [
    google_compute_network.network,
  ]
}

module "firewall_rules" {
  source   = "r-teller/firewall-rules/google"
  for_each = local.firewall_rules

  project_id = local.project_id
  network    = each.value.network

  firewall_rule = each.value

  depends_on = [
    google_compute_network.network,
  ]
}

module "palo_alto_01" {
  source = "./modules/ngfw_palo_alto"
  depends_on = [
    google_compute_network.network,
    google_compute_subnetwork.subnetwork,
  ]

  project                = local.project_id
  ssh_key                = file("./ngfw_ssh_key.pub")
  firewall_name          = "palo-alto-01"
  region                 = "us-central1"
  zone                   = "us-central1-a"
  tags                   = ["us-central1", "us-central1-a", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
  bootstrap_files_staged = true
  interfaces = {
    0 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
      externalEnabled = false,
    },
    1 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
      externalEnabled = true,
    },
    2 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
      externalEnabled = false,
    },
    3 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
      externalEnabled = false,
    },
  }
}

module "palo_alto_02" {
  source = "./modules/ngfw_palo_alto"
  depends_on = [
    google_compute_network.network,
    google_compute_subnetwork.subnetwork,
  ]

  project                = local.project_id
  ssh_key                = file("./ngfw_ssh_key.pub")
  firewall_name          = "palo-alto-02"
  region                 = "us-central1"
  zone                   = "us-central1-b"
  tags                   = ["us-central1", "us-central1-b", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
  bootstrap_files_staged = true
  interfaces = {
    0 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
      externalEnabled = false,
    },
    1 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
      externalEnabled = true,
    },
    2 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
      externalEnabled = false,
    },
    3 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
      externalEnabled = false,
    },
  }
}

module "palo_alto_03" {
  source = "./modules/ngfw_palo_alto"
  depends_on = [
    google_compute_network.network,
    google_compute_subnetwork.subnetwork,
  ]

  project                = local.project_id
  ssh_key                = file("./ngfw_ssh_key.pub")
  firewall_name          = "palo-alto-03"
  region                 = "us-east4"
  zone                   = "us-east4-a"
  tags                   = ["us-east4", "us-east4-a", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
  bootstrap_files_staged = true
  interfaces = {
    0 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
      externalEnabled = false,
    },
    1 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
      externalEnabled = true,
    },
    2 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
      externalEnabled = false,
    },
    3 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
      externalEnabled = false,
    },
  }
}

module "palo_alto_04" {
  source = "./modules/ngfw_palo_alto"
  depends_on = [
    google_compute_network.network,
    google_compute_subnetwork.subnetwork,
  ]

  project                = local.project_id
  ssh_key                = file("./ngfw_ssh_key.pub")
  firewall_name          = "palo-alto-04"
  region                 = "us-east4"
  zone                   = "us-east4-b"
  tags                   = ["us-east4", "us-east4-b", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
  bootstrap_files_staged = true
  interfaces = {
    0 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
      externalEnabled = false,
    },
    1 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
      externalEnabled = true,
    },
    2 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
      externalEnabled = false,
    },
    3 = {
      network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
      subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0],
      internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
      externalEnabled = false,
    },
  }
}

locals {
  // This will create a unique map of Network and Zone combinations based on the provided instances
  // Items will only be added to the list if the instances are in the same region as var.region
  network_zone_map = {
    for i in distinct([
      for instance in local.instances : {
        network      = instance.primary_network != null ? instance.primary_network : null,
        zone         = instance.zone != null ? instance.zone : null,
        network_name = instance.primary_network != null ? split("/", instance.primary_network)[9] : null,
      } if instance.name != null
    ]) : "${i.network}__${i.zone}" => i
  }
  instances = [
    {
      name            = module.palo_alto_01.name,
      zone            = module.palo_alto_01.zone,
      primary_network = module.palo_alto_01.primary_network,
      self_link       = module.palo_alto_01.self_link,
    },
    {
      name            = module.palo_alto_02.name,
      zone            = module.palo_alto_02.zone,
      primary_network = module.palo_alto_02.primary_network,
      self_link       = module.palo_alto_02.self_link,
    },
    {
      name            = module.palo_alto_03.name,
      zone            = module.palo_alto_03.zone,
      primary_network = module.palo_alto_03.primary_network,
      self_link       = module.palo_alto_03.self_link,
    },
    {
      name            = module.palo_alto_04.name,
      zone            = module.palo_alto_04.zone,
      primary_network = module.palo_alto_04.primary_network,
      self_link       = module.palo_alto_04.self_link,
    },
  ]
  session_affinity = "CLIENT_IP"
  health_check = {
    type                = "https"
    check_interval_sec  = 40
    timeout_sec         = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    request_path        = "/php/login.php"
    enable_log          = true
    host                = ""
    port                = 443
    port_name           = "health-check-port"
    proxy_header        = "NONE"
    request             = ""
    response            = ""
  }
}

resource "google_compute_instance_group" "instance_group" {
  for_each = local.network_zone_map
  project  = local.project_id

  name    = "ig-${each.value.network_name}-${each.value.zone}-nlb"
  network = each.value.network
  zone    = each.value.zone

  instances = [
    for instance in local.instances : instance.self_link
    // Since instances can only be a member of a single instance group, 
    // this IF block checks to see if the instance and instance-group belong to the same network
    if instance.zone == each.value.zone && (instance.primary_network != null ? instance.primary_network : null) == each.value.network
  ]
}

module "firewall-nlb-outside-usc1" {
  source  = "r-teller/firewall-nlb/google"
  version = "0.0.5-alpha"

  name             = "firewall-nlb-outside-usc1"
  project_id       = local.project_id
  backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-central1", instance_group.zone))]
  network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0]
  subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0]
  ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0], -3)
  all_ports        = true
  ports            = []
  global_access    = true
  session_affinity = local.session_affinity
  region           = "us-central1"
  dest_ranges = [{
    range    = "192.168.0.0/16",
    priority = 1000,
    }, {
    range    = "172.16.0.0/12",
    priority = 1000,
    }, {
    range    = "10.0.0.0/8",
    priority = 1000,
    }
  ]
  health_check = local.health_check
}

module "firewall-nlb-outside-use4" {
  source  = "r-teller/firewall-nlb/google"
  version = "0.0.5-alpha"

  name             = "firewall-nlb-outside-use4"
  project_id       = local.project_id
  backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-east4", instance_group.zone))]
  network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0]
  subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0]
  ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0], -3)
  all_ports        = true
  ports            = []
  global_access    = true
  session_affinity = local.session_affinity
  region           = "us-east4"
  dest_ranges = [{
    range    = "192.168.0.0/16",
    priority = 1000,
    }, {
    range    = "172.16.0.0/12",
    priority = 1000,
    }, {
    range    = "10.0.0.0/8",
    priority = 1000,
    }
  ]
  health_check = local.health_check
}

module "firewall-nlb-dmz-usc1" {
  source  = "r-teller/firewall-nlb/google"
  version = "0.0.5-alpha"

  name             = "firewall-nlb-dmz-usc1"
  project_id       = local.project_id
  backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-central1", instance_group.zone))]
  network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0]
  subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0]
  ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0], -3)
  all_ports        = true
  ports            = []
  global_access    = true
  session_affinity = local.session_affinity
  region           = "us-central1"
  dest_ranges = [
    {
      range    = "0.0.0.0/0",
      priority = 1000,
    }
  ]
  health_check = local.health_check
}

module "firewall-nlb-dmz-use4" {
  source  = "r-teller/firewall-nlb/google"
  version = "0.0.5-alpha"

  name             = "firewall-nlb-dmz-use4"
  project_id       = local.project_id
  backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-east4", instance_group.zone))]
  network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0]
  subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0]
  ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0], -3)
  all_ports        = true
  ports            = []
  global_access    = true
  session_affinity = local.session_affinity
  region           = "us-east4"
  dest_ranges = [
    {
      range    = "0.0.0.0/0",
      priority = 1000,
    }
  ]
  health_check = local.health_check
}

module "firewall-nlb-inside-usc1" {
  source  = "r-teller/firewall-nlb/google"
  version = "0.0.5-alpha"

  name             = "firewall-nlb-inside-usc1"
  project_id       = local.project_id
  backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-central1", instance_group.zone))]
  network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0]
  subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0]
  ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0], -3)
  all_ports        = true
  ports            = []
  global_access    = true
  session_affinity = local.session_affinity
  region           = "us-central1"
  dest_ranges = [
    {
      range    = "0.0.0.0/0",
      priority = 1000,
    }
  ]
  health_check = local.health_check
}

module "firewall-nlb-inside-use4" {
  source  = "r-teller/firewall-nlb/google"
  version = "0.0.5-alpha"

  name             = "firewall-nlb-inside-use4"
  project_id       = local.project_id
  backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-east4", instance_group.zone))]
  network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0]
  subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0]
  ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0], -3)
  all_ports        = true
  ports            = []
  global_access    = true
  session_affinity = local.session_affinity
  region           = "us-east4"
  dest_ranges = [
    {
      range    = "0.0.0.0/0",
      priority = 1000,
    }
  ]
  health_check = local.health_check
}
