locals {
  cloud_nat = merge(flatten([
    for network in var.network_configs : {
      for region in keys(network.subnetworks) : "${var.prefix}-${var.environment}-${network.name}-${region}-router" => {
        name    = "${var.prefix}-${var.environment}-${network.name}-${region}-router",
        region  = region,
        network = "${var.prefix}-${var.environment}-vpc-${network.name}",
      } if 0 < length(regexall("outside", network.name))
    }
  ])...)
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  project = var.project_id

  for_each = local.cloud_nat
  name     = each.value.name
  network  = each.value.network
  region   = each.value.region

  depends_on = [
    google_compute_network.networks
  ]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "nat" {
  for_each = google_compute_router.router

  name                               = "${each.value.name}-nat"
  project                            = var.project_id
  router                             = each.value.name
  region                             = each.value.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}