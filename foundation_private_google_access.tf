## Useful Links
// Private Google Access
//// Google Cloud - https://cloud.google.com/vpc/docs/private-google-access
//// Configuring - https://cloud.google.com/vpc/docs/configure-private-google-access
// Cloud DNS - Managed Zones
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone
// Cloud DNS - Record Set
//// Terraform - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set

resource "random_id" "random_id_pga" {
  for_each = local.map_private_google_access
  #   count       = can(local.map_private_google_access["PRIVATE"]) ? 1 : 0
  byte_length = 2
}

locals {
  private_google_access_domains = [
    {
      mode    = "PRIVATE",
      name    = "private.googleapis.com.",
      cname   = "*.googleapis.com.",
      domain  = "googleapis.com.",
      records = ["199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"]
      }, {

      mode    = "PRIVATE",
      name    = "private.gcr.com.",
      cname   = "*.gcr.com.",
      domain  = "gcr.com.",
      records = ["199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"]
    },
    {
      mode    = "RESTRICTED",
      name    = "restricted.googleapis.com",
      cname   = "*.googleapis.com.",
      domain  = "googleapis.com.",
      records = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
      }, {
      mode    = "RESTRICTED"
      name    = "restricted.gcr.com.",
      cname   = "*.gcr.com.",
      domain  = "gcr.com.",
      records = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
    }
  ]

  private_google_access_modes = flatten(distinct(local.private_google_access_domains.*.mode))

  private_google_access_configs = [for network in var.network_configs : {
    project_id  = try(network.project_id, var.project_id)
    prefix      = try(network.prefix, var.prefix, null)
    environment = try(network.environment, var.environment, null)

    network = templatefile("${path.module}/templates/network.tftpl", {
      attributes = {
        name        = try(network.name, null),
        label       = network.label,
        prefix      = try(network.prefix, var.prefix, null),
        environment = try(network.environment, var.environment, null)
    } })

    mode = network.private_google_access
    } if try(contains(local.private_google_access_modes, network.private_google_access), false)
  ]

  map_private_google_access = merge([for config in local.private_google_access_configs : {
    for domain in local.private_google_access_domains : format("%s__%s__%s__%s", config.mode, config.network, config.project_id, domain.name) => merge(config, domain, { id = format("https://www.googleapis.com/compute/v1/projects/%s/global/networks/%s", config.project_id, config.network) }) if config.mode == domain.mode
  }]...)

}

resource "google_dns_managed_zone" "managed_zones" {
  for_each = local.map_private_google_access
  project  = each.value.project_id
  name = templatefile("${path.module}/templates/cloud_dns_zone.tftpl", {
    attributes = {
      name   = null,
      fqdn   = each.value.name,
      suffix = random_id.random_id_pga[each.key].hex,
  } })

  dns_name = each.value.domain

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = each.value.id
    }
  }


  depends_on = [
    google_compute_network.networks
  ]
}

resource "google_dns_record_set" "dns_record_set_a" {
  for_each = local.map_private_google_access
  project  = each.value.project_id

  name         = each.value.name
  managed_zone = google_dns_managed_zone.managed_zones[each.key].name
  type         = "A"
  ttl          = 300

  rrdatas = each.value.records

  depends_on = [
    google_compute_network.networks,
    google_dns_managed_zone.managed_zones,
  ]
}

resource "google_dns_record_set" "dns_record_set_cname" {
  for_each = local.map_private_google_access
  project  = each.value.project_id

  name         = each.value.cname
  managed_zone = google_dns_managed_zone.managed_zones[each.key].name
  type         = "CNAME"
  ttl          = 300

  rrdatas = [each.value.name]

  depends_on = [
    google_compute_network.networks,
    google_dns_managed_zone.managed_zones,
  ]
}
