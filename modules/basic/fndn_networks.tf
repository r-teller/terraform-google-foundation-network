## Useful Links
// Network
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
//// GCLOUD - https://cloud.google.com/sdk/gcloud/reference/compute/networks/create
// Network Peering (To Be Documented)
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering_routes_config
// Private Service Connection (To Be Built)
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection

locals {
  defaults_network = {
    routing_mode = "REGIONAL"
    mtu          = 1460
    peers        = []
  }

  networks = { for network in var.network_configs : "${var.prefix}-${var.environment}-vpc-${network.name}" => {
    id                      = "projects/${var.project_id}/global/networks/${var.prefix}-${var.environment}-vpc-${network.name}"
    routing_mode            = try(network.routing_mode, local.defaults_network.routing_mode)
    mtu                     = try(network.mtu, local.defaults_network.mtu)
    auto_create_subnetworks = false
    peers                   = try(network.peers, local.defaults_network.peers)
    private_service_connection = {
      address       = try(split("/", network.private_service_connection.ip_cidr_range)[0], null)
      prefix_length = try(split("/", network.private_service_connection.ip_cidr_range)[1], network.private_service_connection.ip_cidr_prefix, null)

      import_custom_routes = try(network.private_service_connection.import_custom_routes, false)
      export_custom_routes = try(network.private_service_connection.export_custom_routes, false)
    }
  } }

  network_peering_maps = flatten([for key, value in local.networks : [
    for peer in value.peers : {
      local_network_id = value.id
      peer_network_id  = try("projects/${try(peer.project_id, var.project_id)}/global/networks/${peer.network}", null)

      import_custom_routes = try(peer.import_custom_routes, null)
      export_custom_routes = try(peer.export_custom_routes, null)

      import_subnet_routes_with_public_ip = try(peer.import_subnet_routes_with_public_ip, null)
      export_subnet_routes_with_public_ip = try(peer.export_subnet_routes_with_public_ip, null)

      key = "peer-${uuidv5("x500", "LOCAL=${key},REMOTE=${try("projects/${try(peer.project_id, var.project_id)}/global/networks/${peer.network}", peer.name, "null")}")}"
    }
  ]])
}

resource "google_compute_network" "networks" {
  project                         = var.project_id
  for_each                        = local.networks
  name                            = each.key
  auto_create_subnetworks         = each.value.auto_create_subnetworks
  mtu                             = each.value.mtu
  routing_mode                    = each.value.routing_mode
  delete_default_routes_on_create = true
}


resource "google_compute_global_address" "global_address" {
  project  = var.project_id
  for_each = { for key, value in local.networks : key => value if(value.private_service_connection.prefix_length != null || value.private_service_connection.address != null) }

  name          = each.key
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = each.value.private_service_connection.address
  prefix_length = each.value.private_service_connection.prefix_length
  network       = each.value.id

  depends_on = [
    google_compute_network.networks
  ]
}

resource "google_service_networking_connection" "service_networking_connection" {
  for_each = google_compute_global_address.global_address

  network = each.value.network
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [
    each.value.name
  ]
}

# # "network": "https://www.googleapis.com/compute/v1/projects/rteller-demo-host-aaaa/global/networks/test-cases-vpc-network-private-service-connection-both",
# # "peering": "servicenetworking-googleapis-com",
resource "google_compute_network_peering_routes_config" "service_networking_connection_peering" {
  project  = var.project_id  
  for_each = google_service_networking_connection.service_networking_connection

  network = each.value.network
  peering = each.value.peering

  import_custom_routes = true//(lookup(local.networks, regex("global/networks/(?P<network>[^/]*)", each.value.network).network)).private_service_connection.import_custom_routes
  export_custom_routes = true//(lookup(local.networks, regex("global/networks/(?P<network>[^/]*)", each.value.network).network)).private_service_connection.export_custom_routes
}

resource "google_compute_network_peering" "network_peering" {
  for_each = { for peering in local.network_peering_maps : peering.key => peering }

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