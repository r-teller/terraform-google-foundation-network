locals {
  subnetworks = merge(flatten([
    for network in local.network_configs : [
      for region, subnetwork in network.subnetworks : {
        for key, value in subnetwork : "${network.name}-${region}-${key}" => merge(
          value, {
            name    = "${local.prefix}-${local.environment}-${network.name}-subnet-${replace(value.ip_cidr_range, "//|\\./", "-")}"
            network = "${local.prefix}-${local.environment}-vpc-${network.name}",
            region  = region
          }
        )
      }
    ]
  ])...)
}

# output "subnetworks" {
#   value = local.subnetworks
# }

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "subnetwork" {
  project  = local.project_id
  for_each = local.subnetworks

  name                     = each.value.name
  region                   = each.value.region
  network                  = each.value.network
  ip_cidr_range            = each.value.ip_cidr_range
  private_ip_google_access = can(each.value.private_ip_google_access) ? each.value.private_ip_google_access : null
  dynamic "secondary_ip_range" {
    for_each = can(each.value.secondary_ranges) ? each.value.secondary_ranges : []
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  depends_on = [
    google_compute_network.networks
  ]
}