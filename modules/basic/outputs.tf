output "cloud_nat_networks" {
  value = local.cloud_nat_networks
}
output "cloud_nat_subnetworks" {
  value = local.cloud_nat_subnetworks
}
output "cloud_nat_primary_subnetworks" {
  value = local.cloud_nat_primary_subnetworks
}
output "cloud_nat_secondary_subnetworks" {
  value = local.cloud_nat_secondary_subnetworks
}
output "cloud_nat_mapped_subnetwork_nat_groups" {
  value = local.cloud_nat_mapped_subnetwork_nat_groups
}

output "cloud_nats" {
  value = local.cloud_nats
}

# output "networks" {
#   value = google_compute_network.networks
# }

output "local_subnetworks" {
  value = local.subnetworks
}
output "resource_subnetworks" {
  value = google_compute_subnetwork.subnetworks
}