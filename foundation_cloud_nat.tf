
## Useful Links
// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
// GCLOUD - https://cloud.google.com/sdk/gcloud/reference/compute/routers/nats/create



locals {
  defaults_cloud_nat = {
    min_ports_per_vm                   = 64
    udp_idle_timeout                   = 30
    icmp_idle_timeout                  = 30
    tcp_established_idle_timeout       = 120
    tcp_transitory_idle_timeout        = 30
    log_config                         = "DISABLED"
    source_subnetwork_ip_ranges_to_nat = "DISABLED"
    subnetworks = {
      source_ip_ranges_to_nat = "DISABLED"
    }
  }

  lookups_source_subnetwork_ip_ranges_to_nat = {
    "DISABLED"                                                    = "DISABLED"
    "ALL_PRIMARY_SUBNETWORKS"                                     = "ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES"
    "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS"           = "ALL_SUBNETWORKS_ALL_IP_RANGES"
    "SELECTED_PRIMARY_SUBNETWORKS_SELECTED_SECONDARY_SUBNETWORKS" = "LIST_OF_SUBNETWORKS"
  }

  lookups_source_ip_ranges_to_nat = {
    "DISABLED"                                          = ["DISABLED"]
    "ALL_SUBNETWORKS"                                   = ["ALL_IP_RANGES"]
    "ALL_SECONDARY_SUBNETWORKS"                         = ["LIST_OF_SECONDARY_IP_RANGES"]
    "PRIMARY_SUBNETWORK"                                = ["PRIMARY_IP_RANGE"]
    "PRIMARY_SUBNETWORK_SELECTED_SECONDARY_SUBNETWORKS" = ["PRIMARY_IP_RANGE", "LIST_OF_SECONDARY_IP_RANGES"]
    "SELECTED_SECONDARY_SUBNETWORKS"                    = ["LIST_OF_SECONDARY_IP_RANGES"]
  }

  cloud_nat_groups = merge(distinct(flatten([
    for network in var.network_configs : {
      for nat_group in network.cloud_nat.nat_groups : "${var.prefix}-${var.environment}-vpc-${network.name}__${nat_group.nat_group_id}" => {
        network                      = "${var.prefix}-${var.environment}-vpc-${network.name}"
        nat_group_id                 = nat_group.nat_group_id
        log_config                   = try(nat_group.log_config, local.defaults_cloud_nat.log_config)
        min_ports_per_vm             = try(nat_group.min_ports_per_vm, local.defaults_cloud_nat.min_ports_per_vm)
        udp_idle_timeout             = try(nat_group.udp_idle_timeout, local.defaults_cloud_nat.udp_idle_timeout)
        icmp_idle_timeout            = try(nat_group.icmp_idle_timeout, local.defaults_cloud_nat.icmp_idle_timeout)
        tcp_established_idle_timeout = try(nat_group.tcp_established_idle_timeout, local.defaults_cloud_nat.tcp_established_idle_timeout)
        tcp_transitory_idle_timeout  = try(nat_group.tcp_transitory_idle_timeout, local.defaults_cloud_nat.tcp_transitory_idle_timeout)
      } if can(nat_group.nat_group_id)
    } if try((network.cloud_nat.subnetworks_to_nat == "SELECTED_PRIMARY_SUBNETWORKS_SELECTED_SECONDARY_SUBNETWORKS" && 0 < length(network.cloud_nat.nat_groups)), false)
  ]))...)

  cloud_nat_networks = { for cloud_nat_network in distinct(flatten([
    for network in var.network_configs : [
      for primary_subnetwork in network.subnetworks : {
        region            = lower(primary_subnetwork.region)
        region_shortname  = module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]
        network           = "${var.prefix}-${var.environment}-vpc-${network.name}"
        network_shortname = network.name

        name   = "${network.name}-${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}-router-nat"
        router = "${network.name}-${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}-router-nat"

        source_subnetwork_ip_ranges_to_nat = try(lookup(local.lookups_source_subnetwork_ip_ranges_to_nat, network.cloud_nat.subnetworks_to_nat), local.defaults_cloud_nat.source_subnetwork_ip_ranges_to_nat)

        log_config                   = try(network.cloud_nat.log_config, local.defaults_cloud_nat.log_config)
        min_ports_per_vm             = try(network.cloud_nat.min_ports_per_vm, local.defaults_cloud_nat.min_ports_per_vm)
        udp_idle_timeout             = try(network.cloud_nat.udp_idle_timeout, local.defaults_cloud_nat.udp_idle_timeout)
        icmp_idle_timeout            = try(network.cloud_nat.icmp_idle_timeout, local.defaults_cloud_nat.icmp_idle_timeout)
        tcp_established_idle_timeout = try(network.cloud_nat.tcp_established_idle_timeout, local.defaults_cloud_nat.tcp_established_idle_timeout)
        tcp_transitory_idle_timeout  = try(network.cloud_nat.tcp_transitory_idle_timeout, local.defaults_cloud_nat.tcp_transitory_idle_timeout)
      } if try(contains(["ALL_PRIMARY_SUBNETWORKS", "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS"], network.cloud_nat.subnetworks_to_nat), false)
    ] if try(contains(["ALL_PRIMARY_SUBNETWORKS", "ALL_PRIMARY_SUBNETWORKS_ALL_SECONDARY_SUBNETWORKS"], network.cloud_nat.subnetworks_to_nat), false)
  ])) : "${cloud_nat_network.network}__${cloud_nat_network.region_shortname}" => cloud_nat_network }

  # "DISABLED"                                          = ["DISABLED"]
  # "ALL_SECONDARY_SUBNETWORKS"                         = ["LIST_OF_SECONDARY_IP_RANGES"]
  # "SELECTED_SECONDARY_SUBNETWORKS"                    = ["LIST_OF_SECONDARY_IP_RANGES"]

  # "ALL_SUBNETWORKS"                                   = ["ALL_IP_RANGES"]
  # "PRIMARY_SUBNETWORK"                                = ["PRIMARY_IP_RANGE"]
  # "PRIMARY_SUBNETWORK_SELECTED_SECONDARY_SUBNETWORKS" = ["PRIMARY_IP_RANGE", "LIST_OF_SECONDARY_IP_RANGES"]
  cloud_nat_primary_subnetworks = distinct(flatten([
    for network in var.network_configs : [
      for primary_subnetwork in network.subnetworks : {
        region            = lower(primary_subnetwork.region)
        network           = "${var.prefix}-${var.environment}-vpc-${network.name}"
        network_shortname = network.name

        router = "${network.name}-${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}-router-nat"

        primary_subnetwork_name = try(primary_subnetwork.name, "${network.name}-${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}-primary-${replace(primary_subnetwork.ip_cidr_range, "//|\\./", "-")}")

        nat_group_id         = primary_subnetwork.cloud_nat.nat_group_id
        mapping_nat_group_id = "${var.prefix}-${var.environment}-vpc-${network.name}__${primary_subnetwork.cloud_nat.nat_group_id}__${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}"

        source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
      } if can(lookup(local.cloud_nat_groups, "${var.prefix}-${var.environment}-vpc-${network.name}__${primary_subnetwork.cloud_nat.nat_group_id}")) &&
      try(contains(["ALL_SUBNETWORKS", "PRIMARY_SUBNETWORK", "PRIMARY_SUBNETWORK_SELECTED_SECONDARY_SUBNETWORKS"], primary_subnetwork.cloud_nat.subnetworks_to_nat), false)
    ] if can(network.subnetworks)
  ]))

  cloud_nat_secondary_subnetworks = distinct(flatten([
    for network in var.network_configs : [
      for primary_subnetwork in network.subnetworks : [
        for secondary_subnetwork in primary_subnetwork.secondary_subnetworks : {
          region            = lower(primary_subnetwork.region)
          network           = "${var.prefix}-${var.environment}-vpc-${network.name}"
          network_shortname = network.name

          router = "${network.name}-${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}-router-nat"

          primary_subnetwork_name   = try(primary_subnetwork.name, "${network.name}-${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}-primary-${replace(primary_subnetwork.ip_cidr_range, "//|\\./", "-")}")
          secondary_subnetwork_name = "${network.name}-${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}-secondary-${replace(secondary_subnetwork.ip_cidr_range, "//|\\./", "-")}"

          nat_group_id         = secondary_subnetwork.nat_group_id
          mapping_nat_group_id = "${var.prefix}-${var.environment}-vpc-${network.name}__${secondary_subnetwork.nat_group_id}__${module.gcp_utils.region_short_name_map[lower(primary_subnetwork.region)]}"

          source_ip_ranges_to_nat = ["LIST_OF_SECONDARY_IP_RANGES"]
        } if can(lookup(local.cloud_nat_groups, "${var.prefix}-${var.environment}-vpc-${network.name}__${secondary_subnetwork.nat_group_id}"))
      ] if can(primary_subnetwork.secondary_subnetworks) &&
      try(contains(["SELECTED_SECONDARY_SUBNETWORKS", "PRIMARY_SUBNETWORK_SELECTED_SECONDARY_SUBNETWORKS"], primary_subnetwork.cloud_nat.subnetworks_to_nat), false)
    ] if can(network.subnetworks)
  ]))

  cloud_nat_subnetworks = concat(
    local.cloud_nat_primary_subnetworks,
    local.cloud_nat_secondary_subnetworks,
  )

  mapping_nat_group_ids = distinct([for x in local.cloud_nat_subnetworks : {
    mapping_nat_group_id = x.mapping_nat_group_id,
    nat_group_id         = x.nat_group_id
    network_shortname    = x.network_shortname
    region               = x.region
    router               = x.router
  }])

  cloud_nat_mapped_subnetwork_nat_groups = { for values in local.mapping_nat_group_ids : values.mapping_nat_group_id => merge({
    net_group_id = values.nat_group_id
    router       = values.router
    name         = "${values.router}-${values.nat_group_id}"
    region       = values.region

    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

    subnetworks = [for x in local.cloud_nat_subnetworks : {
      name                     = x.primary_subnetwork_name
      source_ip_ranges_to_nat  = x.source_ip_ranges_to_nat
      secondary_ip_range_names = try([x.secondary_subnetwork_name], [])
    } if x.mapping_nat_group_id == values.mapping_nat_group_id]
  }, lookup(local.cloud_nat_groups, "${var.prefix}-${var.environment}-vpc-${values.network_shortname}__${values.nat_group_id}")) }

  cloud_nats = merge(local.cloud_nat_networks, local.cloud_nat_mapped_subnetwork_nat_groups)
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "cloud_nat_routers" {
  project = var.project_id

  for_each = { for y in distinct([for x in local.cloud_nats : { router = x.router, region = x.region, network = x.network }]) : y.router => y }
  name     = each.value.router

  network = each.value.network
  region  = each.value.region

  depends_on = [
    google_compute_network.networks,
  ]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "cloud_nats" {
  for_each = local.cloud_nats
  project  = var.project_id

  name                               = each.value.name
  router                             = each.value.router
  region                             = each.value.region
  source_subnetwork_ip_ranges_to_nat = each.value.source_subnetwork_ip_ranges_to_nat
  nat_ip_allocate_option             = "AUTO_ONLY"

  # Cloud NAT Options
  min_ports_per_vm                 = each.value.min_ports_per_vm
  tcp_established_idle_timeout_sec = each.value.tcp_established_idle_timeout
  tcp_transitory_idle_timeout_sec  = each.value.tcp_transitory_idle_timeout
  icmp_idle_timeout_sec            = each.value.icmp_idle_timeout
  udp_idle_timeout_sec             = each.value.udp_idle_timeout

  log_config {
    enable = contains(["ALL", "ERRORS_ONLY", "TRANSLATIONS_ONLY"], each.value.log_config)
    filter = contains(["ALL", "ERRORS_ONLY", "TRANSLATIONS_ONLY"], each.value.log_config) ? each.value.log_config : "ALL"
  }

  dynamic "subnetwork" {
    for_each = try(each.value.subnetworks, [])
    content {
      name                     = "projects/${var.project_id}/regions/${each.value.region}/subnetworks/${subnetwork.value.name}"
      secondary_ip_range_names = subnetwork.value.secondary_ip_range_names
      source_ip_ranges_to_nat  = subnetwork.value.source_ip_ranges_to_nat
    }
  }

  depends_on = [
    google_compute_network.networks,
    google_compute_subnetwork.subnetworks,
    google_compute_router.cloud_nat_routers,
  ]
}
