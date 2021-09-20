locals {
  routes = merge([
    for network in var.network_configs : {
      for route in network.routes : "${var.prefix}--${var.environment}--${network.name}--${route.name}" => merge(
        route, {
          network  = "${var.prefix}-${var.environment}-vpc-${network.name}",
          priority = can(route.priority) ? route.priority : 1000
          tags     = can(route.tags) ? route.tags : []
        }
      )
    }
  ]...)
}

resource "google_compute_route" "route_next_hop_gateway" {
  for_each = { for key, route in local.routes : key => route if can(route.next_hop_gateway) }

  name             = each.key
  project          = var.project_id
  network          = each.value.network
  dest_range       = each.value.dest_range
  next_hop_gateway = each.value.next_hop_gateway
  priority         = each.value.priority
  tags             = each.value.tags

  depends_on = [
    google_compute_network.networks
  ]
}
