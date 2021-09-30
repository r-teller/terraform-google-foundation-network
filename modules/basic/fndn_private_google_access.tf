## Useful Links
// Private Google Access
//// Google Cloud - https://cloud.google.com/vpc/docs/private-google-access
//// Configuring - https://cloud.google.com/vpc/docs/configure-private-google-access
// Cloud DNS - Managed Zones
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone
// Cloud DNS - Record Set
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set



resource "random_id" "random_id_pga" {
  count       = can(local.map_private_google_access["PRIVATE"]) ? 1 : 0
  byte_length = 2
}

locals {
  defaults_private_google_access = {
    mode = "DISABLED"
  }

  private_google_access_networks = [for network in var.network_configs : {
    name         = "${var.prefix}-${var.environment}-vpc-${network.name}"
    network_name = network.name

    id   = "projects/${var.project_id}/global/networks/${var.prefix}-${var.environment}-vpc-${network.name}"
    mode = network.private_google_access
    } if try(contains(["PRIVATE", "RESTRICTED"], network.private_google_access), false)
  ]

  map_private_google_access = merge([for mode in ["PRIVATE", "RESTRICTED"] : {
    for network in local.private_google_access_networks : mode => [
      network.id
    ] if network.mode == mode
  }]...)
}

######## Private Google Access Zones ########

resource "google_dns_managed_zone" "managed_zone_private" {
  count = can(local.map_private_google_access["PRIVATE"]) ? 1 : 0

  project = var.project_id

  name     = "dns-private-googleapis-com-${random_id.random_id_pga[0].hex}"
  dns_name = "googleapis.com."


  visibility = "private"

  private_visibility_config {
    dynamic "networks" {
      for_each = local.map_private_google_access["PRIVATE"]
      content {
        network_url = networks.value
      }
    }
  }

  depends_on = [
    google_compute_network.networks
  ]
}

resource "google_dns_record_set" "dns_record_set_a_private" {
  count   = can(local.map_private_google_access["PRIVATE"]) ? 1 : 0
  project = var.project_id

  name         = "private.${google_dns_managed_zone.managed_zone_private[0].dns_name}"
  managed_zone = google_dns_managed_zone.managed_zone_private[0].name
  type         = "A"
  ttl          = 300

  rrdatas = ["199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"]
}

resource "google_dns_record_set" "dns_record_set_cname_private" {
  count   = can(local.map_private_google_access["PRIVATE"]) ? 1 : 0
  project = var.project_id

  name         = "*.${google_dns_managed_zone.managed_zone_private[0].dns_name}"
  managed_zone = google_dns_managed_zone.managed_zone_private[0].name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["private.googleapis.com."]
}

######## Restricted Google Access Zones ########

resource "google_dns_managed_zone" "managed_zone_restricted" {
  count    = can(local.map_private_google_access["RESTRICTED"]) ? 1 : 0
  project  = var.project_id
  name     = "dns-restricted-googleapis-com-${random_id.random_id_pga[0].hex}"
  dns_name = "googleapis.com."


  visibility = "private"

  private_visibility_config {
    dynamic "networks" {
      for_each = local.map_private_google_access["RESTRICTED"]
      content {
        network_url = networks.value
      }
    }
  }

  depends_on = [
    google_compute_network.networks
  ]
}

resource "google_dns_record_set" "dns_record_set_a_restricted" {
  count   = can(local.map_private_google_access["RESTRICTED"]) ? 1 : 0
  project = var.project_id

  name         = "restricted.${google_dns_managed_zone.managed_zone_restricted[0].dns_name}"
  managed_zone = google_dns_managed_zone.managed_zone_restricted[0].name
  type         = "A"
  ttl          = 300

  rrdatas = ["199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"]
}

resource "google_dns_record_set" "dns_record_set_cname_restricted" {
  count   = can(local.map_private_google_access["RESTRICTED"]) ? 1 : 0
  project = var.project_id

  name         = "*.${google_dns_managed_zone.managed_zone_restricted[0].dns_name}"
  managed_zone = google_dns_managed_zone.managed_zone_restricted[0].name
  type         = "CNAME"
  ttl          = 300

  rrdatas = ["restricted.googleapis.com."]
}

######## Private/Restricted Google Access Routes ########

# resource "google_compute_route" "route_next_hop_gateway_restricted" {
#   for_each = toset(try([for x in local.map_private_google_access["RESTRICTED"] : regex("global/networks/(?P<network>[^/]*)", x).network], []))

#   project          = var.project_id
#   name             = "${each.key}-psa-${random_id.random_id_pga[0].hex}"
#   network          = each.key
#   dest_range       = "199.36.153.4/30"
#   next_hop_gateway = "default-internet-gateway"
#   priority         = 0

#   depends_on = [
#     google_compute_network.networks
#   ]
# }

# resource "google_compute_route" "route_next_hop_gateway_private" {
#   for_each = toset(try([for x in local.map_private_google_access["PRIVATE"] : regex("global/networks/(?P<network>[^/]*)", x).network], []))

#   project          = var.project_id
#   name             = "${each.key}-psa-${random_id.random_id_pga[0].hex}"
#   network          = each.key
#   dest_range       = "199.36.153.8/30"
#   next_hop_gateway = "default-internet-gateway"
#   priority         = 0

#   depends_on = [
#     google_compute_network.networks
#   ]
# }
