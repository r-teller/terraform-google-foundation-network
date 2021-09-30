## Useful Links
// Route
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route
//// GCLOUD - https://cloud.google.com/sdk/gcloud/reference/compute/routes/create

locals {
  defaults_route = {
    priority         = 1000,
    tags             = [],
    next_hop_gateway = "global/gateways/default-internet-gateway",
    next_hop_type    = "UNKNOWN"
    name             = "UNKNOWN"
  }

  lookups_next_hop_type = {
    "INTERNET_GATEWAY" = "next_hop_gateway",
    "ADDRESS"          = "next_hop_ip",
  }

  lookups_private_google_access_ranges = {
    RESTRICTED = "199.36.153.4/30",
    PRIVATE    = "199.36.153.8/30",
  }

  routes = flatten([
    for network in var.network_configs : [
      for route in network.routes : {
        name             = local.defaults_route.name
        network          = "${var.prefix}-${var.environment}-vpc-${network.name}"
        network_name     = network.name
        dest_range       = route.destination
        next_hop_type    = lookup(local.lookups_next_hop_type, route.next_hop_type, local.defaults_route.next_hop_type)
        next_hop_ip      = try(route.next_hop_address, null)
        next_hop_gateway = local.defaults_route.next_hop_gateway
        priority         = try(route.priority, local.defaults_route.priority)
        tags             = try(route.tags, local.defaults_route.tags)
      } if(can(route.next_hop_type) && can(route.destination))
    ] if can(network.routes)
  ])

  routes_pga = [for network in local.private_google_access_networks : {
    name             = local.defaults_route.name
    network          = network.name
    network_name     = network.network_name
    dest_range       = lookup(local.lookups_private_google_access_ranges, network.mode)
    next_hop_type    = lookup(local.lookups_next_hop_type, "INTERNET_GATEWAY", local.defaults_route.next_hop_type)
    next_hop_ip      = null
    next_hop_gateway = local.defaults_route.next_hop_gateway
    priority         = local.defaults_route.priority
    tags             = local.defaults_route.tags
  }]

  merged_routes = { for route in concat(local.routes, local.routes_pga) : "tf-managed-route-${uuidv5("x500", "PREFIX=${var.prefix},ENVIRONMENT=${var.environment},NETWORK=${route.network_name},NEXT_HOP_TYPE=${route.next_hop_type}, DESTINATION=${route.dest_range}, PRIORITY=${route.priority}, TAG_COUNT=${length(route.tags)}")}" => route
  if contains(["next_hop_gateway", "next_hop_ip"], route.next_hop_type) }
}

resource "google_compute_route" "route_next_hop" {
  # for_each = { for key, value in local.merged_routes : key => value if contains(["next_hop_gateway", "next_hop_ip"], value.next_hop_type) }
  for_each = local.merged_routes

  name             = each.value.name != "UNKNOWN" ? each.value.name : each.key
  project          = var.project_id
  network          = each.value.network
  dest_range       = each.value.dest_range
  next_hop_gateway = each.value.next_hop_type == "next_hop_gateway" ? each.value.next_hop_gateway : null

  next_hop_ip = each.value.next_hop_type == "next_hop_ip" ? each.value.next_hop_ip : null

  next_hop_instance      = null
  next_hop_instance_zone = null

  next_hop_ilb = null
  # next_hop_ilb_region = null

  priority = each.value.priority
  tags     = each.value.tags

  depends_on = [
    google_compute_network.networks,
    google_compute_subnetwork.subnetworks,
  ]
}