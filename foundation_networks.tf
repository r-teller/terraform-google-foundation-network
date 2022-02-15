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

  network_configs = { for network in var.network_configs : templatefile("${path.module}/templates/network.tftpl", { attributes = { name = try(network.name, null), label = try(network.label, null), prefix = try(network.prefix, var.prefix, null), environment = try(network.environment, var.environment, null) } }) => {
    pre_existing            = try(network.pre_existing, false)
    explicit_name           = try(network.name, null)

    project_id              = try(network.project_id, var.project_id)
    routing_mode            = try(network.routing_mode, local.defaults_network.routing_mode)
    mtu                     = try(network.mtu, local.defaults_network.mtu)
    auto_create_subnetworks = false

    peers = try([for peer in network.peers : {
      local_project_id = try(network.project_id, var.project_id)
      local_network    = templatefile("${path.module}/templates/network.tftpl", { attributes = { name = try(network.name, null), label = try(network.label, null), prefix = try(network.prefix, var.prefix, null), environment = try(network.environment, var.environment, null) } })

      // If peer project is specified use that, otherwise default to the project_id used for this VPC
      remote_project_id = try(peer.project, try(network.project_id, var.project_id))

      // 1 - Builds a list of labels for matching if explicit name is not specified for VPC
      // 2 - Checks to see if the peer network field matches any of the labels generated in step 1
      // 3a - If step 2 is true network field matches one of the labels collected in step 1 --> generate vpc name based on naming standard
      // 3b - If step 2 is false network field does not matche any labels collected in step 1 --> use the provided vpc name as an explicit field
      remote_network = contains([for value in var.network_configs : value.label if !can(value.name)], peer.network) ? (
        templatefile("${path.module}/templates/network.tftpl", { attributes = { name = null, label = try(peer.network, null), prefix = try(network.prefix, var.prefix, null), environment = try(network.environment, var.environment, null) } })
      ) : peer.network

      import_custom_routes = try(peer.import_custom_routes, null)
      export_custom_routes = try(peer.export_custom_routes, null)

      import_subnet_routes_with_public_ip = try(peer.import_subnet_routes_with_public_ip, null)
      export_subnet_routes_with_public_ip = try(peer.export_subnet_routes_with_public_ip, null)
    }], local.defaults_network.peers)

    private_service_connection = {
      address       = try(split("/", network.private_service_connection.ip_cidr_range)[0], null)
      prefix_length = try(split("/", network.private_service_connection.ip_cidr_range)[1], network.private_service_connection.ip_cidr_prefix, null)

      import_custom_routes = try(network.private_service_connection.import_custom_routes, false)
      export_custom_routes = try(network.private_service_connection.export_custom_routes, false)
    }
  } }

  networks = merge(data.google_compute_network.networks, google_compute_network.networks)

  network_peering_maps = flatten([for key, value in local.network_configs : [
    for peering in value.peers : {
      local_network_id  = "projects/${peering.local_project_id}/global/networks/${peering.local_network}"
      remote_network_id = "projects/${peering.remote_project_id}/global/networks/${peering.remote_network}"

      import_custom_routes = peering.import_custom_routes
      export_custom_routes = peering.export_custom_routes

      import_subnet_routes_with_public_ip = peering.import_subnet_routes_with_public_ip
      export_subnet_routes_with_public_ip = peering.export_subnet_routes_with_public_ip

      key = "peer-${uuidv5("x500", "LOCAL=projects/${peering.local_project_id}/global/networks/${peering.local_network},REMOTE=projects/${peering.remote_project_id}/global/networks/${peering.remote_network}")}"
    }
  ]])
}

data "google_compute_network" "networks" {
  for_each = { for key, value in local.network_configs : key => value if value.pre_existing == true }
  name     = each.key
  project  = each.value.project_id
}

resource "google_compute_network" "networks" {
  for_each = { for key, value in local.network_configs : key => value if value.pre_existing == false }

  name                            = each.key
  project                         = each.value.project_id
  auto_create_subnetworks         = each.value.auto_create_subnetworks
  mtu                             = each.value.mtu
  routing_mode                    = each.value.routing_mode
  delete_default_routes_on_create = true
}

resource "google_compute_global_address" "global_address" {
  for_each = { for key, value in local.network_configs : key => value if(value.private_service_connection.prefix_length != null || value.private_service_connection.address != null) }

  project       = each.value.project_id
  network       = "projects/${each.value.project_id}/global/networks/${each.key}"
  name          = each.key
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  address       = each.value.private_service_connection.address
  prefix_length = each.value.private_service_connection.prefix_length

  depends_on = [
    google_compute_network.networks,
    data.google_compute_network.networks,
  ]
}

resource "google_service_networking_connection" "service_networking_connection" {
  for_each = { for key, value in local.network_configs : key => value if(value.private_service_connection.prefix_length != null || value.private_service_connection.address != null) }

  network = "projects/${each.value.project_id}/global/networks/${each.key}"
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [
    each.key
  ]

  depends_on = [
    google_compute_network.networks,
    data.google_compute_network.networks,
    google_compute_global_address.global_address,
  ]
}

resource "google_compute_network_peering" "network_peering" {
  for_each = { for peering in local.network_peering_maps : peering.key => peering }

  name = each.key

  network      = each.value.local_network_id
  peer_network = each.value.remote_network_id

  import_custom_routes = each.value.import_custom_routes
  export_custom_routes = each.value.export_custom_routes

  import_subnet_routes_with_public_ip = each.value.import_subnet_routes_with_public_ip
  export_subnet_routes_with_public_ip = each.value.export_subnet_routes_with_public_ip

  depends_on = [
    google_compute_network.networks,
    data.google_compute_network.networks,
  ]
}
