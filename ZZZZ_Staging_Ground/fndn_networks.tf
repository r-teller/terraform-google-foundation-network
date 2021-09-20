locals {
  networks = { for network in local.network_configs : "${local.prefix}-${local.environment}-vpc-${network.name}" => {
    routing_mode            = network.routing_mode
    mtu                     = 1460
    auto_create_subnetworks = false
    peers                   = try(network.peers, [])
  } }

  network_peering_maps = flatten([for key, value in local.networks : [
    for peer in value.peers : {
      name = try(peer.name, null)
      # If peer.name is set the expectation is that the module should change settings for a connection that is already created
      create = !(can(peer.name))
      manage = can(peer.name)

      local_network_id = "projects/${local.project_id}/global/networks/${key}"
      peer_network_id  = try("projects/${try(peer.project_id, local.project_id)}/global/networks/${peer.network}", null)

      import_custom_routes = try(peer.import_custom_routes, null)
      export_custom_routes = try(peer.export_custom_routes, null)

      import_subnet_routes_with_public_ip = try(peer.import_subnet_routes_with_public_ip, null)
      export_subnet_routes_with_public_ip = try(peer.export_subnet_routes_with_public_ip, null)

      key = "peer-${uuidv5("x500", "LOCAL=${key},REMOTE=${try("projects/${try(peer.project_id, local.project_id)}/global/networks/${peer.network}", peer.name, "null")}")}"
    }
  ]])
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "networks" {
  project                         = local.project_id
  for_each                        = local.networks
  name                            = each.key
  auto_create_subnetworks         = each.value.auto_create_subnetworks
  mtu                             = each.value.mtu
  routing_mode                    = each.value.routing_mode
  delete_default_routes_on_create = true
}

// This is used to create VPC Peers and set import/export actions
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering
resource "google_compute_network_peering" "network_peering" {
  for_each = { for peering in local.network_peering_maps : peering.key => peering if peering.create }

  name = each.key

  network      = each.value.local_network_id
  peer_network = each.value.peer_network_id

  import_custom_routes = each.value.import_custom_routes
  export_custom_routes = each.value.export_custom_routes

  import_subnet_routes_with_public_ip = each.value.import_subnet_routes_with_public_ip
  export_subnet_routes_with_public_ip = each.value.export_subnet_routes_with_public_ip

  depends_on = [
    google_compute_network.networks
  ]
}

// This is used to update existing VPC Peers and set import/export actions
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering_routes_config
resource "google_compute_network_peering_routes_config" "network_peering_routes_config" {
  project  = local.project_id
  for_each = { for peering in local.network_peering_maps : peering.key => peering if peering.manage }

  peering = each.value.name
  network = each.value.local_network_id

  import_custom_routes = each.value.import_custom_routes
  export_custom_routes = each.value.export_custom_routes

  depends_on = [
    google_compute_network.networks
  ]
}