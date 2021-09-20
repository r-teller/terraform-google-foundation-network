resource "random_id" "random_id_pga" {
  byte_length = 2
  count       = 3
}

locals {
  private_google_access = [for network in local.network_configs : {
    network               = "${local.prefix}-${local.environment}-vpc-${network.name}"
    network_id            = google_compute_network.networks["${local.prefix}-${local.environment}-vpc-${network.name}"].id
    private_googleapis    = try(lower(network.private_google_access) == "private", false)
    restricted_googleapis = try(lower(network.private_google_access) == "restricted", false)
    }
  ]
}

resource "google_compute_route" "route_next_hop_gateway_restricted" {
  for_each = { for x in local.private_google_access : x.network => x if x.restricted_googleapis }

  project          = local.project_id
  name             = "${each.value.network}-psa-${random_id.random_id_pga[1].hex}"
  network          = each.value.network
  dest_range       = "199.36.153.4/30"
  next_hop_gateway = "default-internet-gateway"
  priority         = 0

  depends_on = [
    google_compute_network.networks
  ]
}

module "dns_restricted_googleapis_com" {
  count = 0 < length([for x in local.private_google_access : x.network_id if x.restricted_googleapis]) ? 1 : 0

  source  = "terraform-google-modules/cloud-dns/google"
  version = "3.1.0"

  project_id = local.project_id
  type       = "private"
  name       = "dns-restricted-googleapis-com-${random_id.random_id_pga[1].hex}"
  domain     = "googleapis.com."

  private_visibility_config_networks = [for x in local.private_google_access : x.network_id if x.restricted_googleapis]

  recordsets = [
    {
      name = "restricted"
      type = "A"
      ttl  = 300
      records = [
        "199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"
      ]
    },
    {
      name = "*"
      type = "CNAME"
      ttl  = 300
      records = [
        "restricted.googleapis.com."
      ]
    },
  ]
}

resource "google_compute_route" "route_next_hop_gateway_private" {
  for_each = { for x in local.private_google_access : x.network => x if x.private_googleapis }

  project          = local.project_id
  name             = "${each.value.network}-psa-${random_id.random_id_pga[2].hex}"
  network          = each.value.network
  dest_range       = "199.36.153.8/30"
  next_hop_gateway = "default-internet-gateway"
  priority         = 0

  depends_on = [
    google_compute_network.networks
  ]
}

module "dns_private_googleapis_com" {
  count = 0 < length([for x in local.private_google_access : x.network_id if x.private_googleapis]) ? 1 : 0

  source  = "terraform-google-modules/cloud-dns/google"
  version = "3.1.0"

  project_id = local.project_id
  type       = "private"
  name       = "dns-private-googleapis-com-${random_id.random_id_pga[2].hex}"
  domain     = "googleapis.com."

  private_visibility_config_networks = [for x in local.private_google_access : x.network_id if x.private_googleapis]

  recordsets = [
    {
      name = "private"
      type = "A"
      ttl  = 300
      records = [
        "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
      ]
    },
    {
      name = "*"
      type = "CNAME"
      ttl  = 300
      records = [
        "restricted.googleapis.com."
      ]
    },
  ]
}