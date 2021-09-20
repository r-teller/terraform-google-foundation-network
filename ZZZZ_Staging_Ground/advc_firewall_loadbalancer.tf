
locals {
  instances = []
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
    # for instance in local.instances : instance.self_link
    # // Since instances can only be a member of a single instance group, 
    # // this IF block checks to see if the instance and instance-group belong to the same network
    # if instance.zone == each.value.zone && (instance.primary_network != null ? instance.primary_network : null) == each.value.network
  ]
}


# // NLB needs to be created per zone other than Mgmt
# module "firewall-nlb-interconnect-usc1" {
#   source  = "r-teller/firewall-loadbalancer/google"
#   version = "0.0.6-alpha"

#   name             = "firewall-nlb-interconnect-usc1"
#   project_id       = local.project_id
#   backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-central1", instance_group.zone))]
#   network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("interconnect-usc1", network.name))][0]
#   subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("interconnect-usc1", subnetwork.name)) && subnetwork.region == "us-central1"][0]
#   ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("interconnect-usc1", subnetwork.name)) && subnetwork.region == "us-central1"][0], -3)
#   all_ports        = true
#   ports            = []
#   global_access    = true
#   session_affinity = local.session_affinity
#   region           = "us-central1"
#   dest_ranges = [
#     {
#       range    = "0.0.0.0/0",
#       priority = 1000,
#       tags     = []
#     }
#   ]
#   health_check = local.health_check
# }


# // NLB needs to be created per zone other than Mgmt
# module "firewall-nlb-interconnect-use4" {
#   source  = "r-teller/firewall-loadbalancer/google"
#   version = "0.0.6-alpha"

#   name             = "firewall-nlb-interconnect-use4"
#   project_id       = local.project_id
#   backends         = [for instance_group in google_compute_instance_group.instance_group : { id = instance_group.id } if 0 < length(regexall("us-east4", instance_group.zone))]
#   network          = [for network in google_compute_network.network : network.name if 0 < length(regexall("interconnect-use4", network.name))][0]
#   subnetwork       = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.name if 0 < length(regexall("interconnect-use4", subnetwork.name)) && subnetwork.region == "us-east4"][0]
#   ip_address       = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("interconnect-use4", subnetwork.name)) && subnetwork.region == "us-east4"][0], -3)
#   all_ports        = true
#   ports            = []
#   global_access    = true
#   session_affinity = local.session_affinity
#   region           = "us-east4"
#   dest_ranges = [
#     {
#       range    = "0.0.0.0/0",
#       priority = 1000,
#       tags     = []
#     }
#   ]
#   health_check = local.health_check
# }