// START -- Output Section for foundation_networks.tf //
output "networks" {
  value = local.networks
}
output "data_networks" {
  value = data.google_compute_network.networks
}
output "resource_networks" {
  value = google_compute_network.networks
}

output "network_configs" {
  value = local.network_configs
}
output "network_peering_maps" {
  value = local.network_peering_maps
}
// STOP -- Output Section for foundation_networks.tf //

// START -- Output Section for foundation_subnetworks.tf //
output "resource_subnetworks" {
  value = google_compute_subnetwork.subnetworks
}

output "resource_subnetworks_backup" {
  value = google_compute_subnetwork.subnetworks_backup
}

output "subnetworks" {
  value = local.subnetworks
}

// STOP -- Output Section for foundation_subnetworks.tf //
