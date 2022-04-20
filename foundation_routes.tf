## Useful Links
// Route
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route
//// GCLOUD - https://cloud.google.com/sdk/gcloud/reference/compute/routes/create

locals {
  defaults_route = {
    priority = 1000,
    tags     = [],

    next_hop_gateway = "default-internet-gateway",
    next_hop_type    = "UNKNOWN"
    name             = "UNKNOWN"
  }

  lookups_next_hop_type = {
    "INTERNET_GATEWAY" = "next_hop_gateway",
    "ADDRESS"          = "next_hop_ip",
    "INSTANCE"         = "next_hop_instance",
    "LOAD_BALANCER"    = "next_hop_ilb"
  }

  lookups_private_google_access_ranges = {
    RESTRICTED = "199.36.153.4/30",
    PRIVATE    = "199.36.153.8/30",
  }

  routes = flatten([
    for network in var.network_configs : [
      for route in network.routes : {
        project_id  = try(network.project_id, var.project_id)
        prefix      = try(network.prefix, var.prefix, null)
        environment = try(network.environment, var.environment, null)

        name = try(route.name, local.defaults_route.name)
        network = templatefile("${path.module}/templates/network.tftpl", {
          attributes = {
            name        = try(network.name, null),
            label       = network.label,
            prefix      = try(network.prefix, var.prefix, null),
            environment = try(network.environment, var.environment, null)
        } })
        dest_range             = route.destination
        next_hop_type          = lookup(local.lookups_next_hop_type, route.next_hop_type, local.defaults_route.next_hop_type)
        next_hop_ilb           = try(route.next_hop_load_balancer, null)
        next_hop_ip            = try(route.next_hop_address, null)
        next_hop_instance      = try(route.next_hop_instance, null)
        next_hop_instance_zone = try(lower(route.next_hop_instance_zone), null)
        next_hop_gateway       = local.defaults_route.next_hop_gateway
        priority               = try(route.priority, local.defaults_route.priority)
        tags                   = try(route.tags, local.defaults_route.tags)
      } if(can(route.next_hop_type) && can(route.destination))
    ] if can(network.routes)
  ])

  routes_pga = distinct([for config in local.private_google_access_configs : {
    name        = local.defaults_route.name
    network     = config.network
    project_id  = config.project_id
    prefix      = config.prefix
    environment = config.environment

    # network_label          = try(config.network_label, null)
    dest_range             = lookup(local.lookups_private_google_access_ranges, config.mode)
    next_hop_type          = lookup(local.lookups_next_hop_type, "INTERNET_GATEWAY", local.defaults_route.next_hop_type)
    next_hop_ilb           = null
    next_hop_ip            = null
    next_hop_instance      = null
    next_hop_instance_zone = null
    next_hop_gateway       = local.defaults_route.next_hop_gateway
    priority               = local.defaults_route.priority
    tags                   = local.defaults_route.tags
  }])

  merged_routes = { for route in concat(local.routes, local.routes_pga) : "route-${uuidv5("x500",
    format("PREFIX=%s,ENVIRONMENT=%s,PROJECT_ID=%s,NETWORK=%s,NEXT_HOP_TYPE=%s,DESTINATION=%s,PRIORITY=%s,TAG_COUNT=%d",
      route.prefix,
      route.environment,
      route.project_id,
      route.network,
      route.next_hop_type,
      route.dest_range,
      route.priority,
      length(route.tags),
  ))}" => route if contains(["next_hop_gateway", "next_hop_ip", "next_hop_ilb", "next_hop_instance"], route.next_hop_type) }
}

resource "google_compute_route" "route_next_hop" {
  for_each = local.merged_routes

  name       = each.value.name != "UNKNOWN" ? each.value.name : each.key
  project    = each.value.project_id
  network    = each.value.network
  dest_range = each.value.dest_range

  next_hop_gateway = each.value.next_hop_type == "next_hop_gateway" ? each.value.next_hop_gateway : null

  next_hop_ip = each.value.next_hop_type == "next_hop_ip" ? each.value.next_hop_ip : null

  next_hop_instance      = each.value.next_hop_type == "next_hop_instance" ? each.value.next_hop_instance : null
  next_hop_instance_zone = each.value.next_hop_type == "next_hop_instance" ? each.value.next_hop_instance_zone : null

  next_hop_ilb = each.value.next_hop_type == "next_hop_ilb" ? each.value.next_hop_ilb : null

  priority = each.value.priority
  tags     = each.value.tags

  depends_on = [
    google_compute_network.networks,
    google_compute_subnetwork.subnetworks,
  ]
}
