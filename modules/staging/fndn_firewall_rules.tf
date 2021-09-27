locals {
  shared_network_firewall_rule_map = merge([for key, value in local.networks : {
    for rule in var.shared_firewall_rules : "${rule.fileName}-${key}-${rule.id}" => merge(rule, { network = key })
  }]...)

  firewall_rules = merge([
    for network in var.network_configs : {
      for firewall_rule in network.firewall_rules : "${var.prefix}--${var.environment}--${network.name}--${firewall_rule.id}" => merge(
        firewall_rule, {
          fileName = "rule"
          network  = "${var.prefix}-${var.environment}-vpc-${network.name}",
        }
      )
    }
  ]...)
}

module "shared_firewall_rules" {
  source   = "r-teller/firewall-rules/google"
  for_each = local.shared_network_firewall_rule_map

  project_id = var.project_id
  network    = each.value.network

  firewall_rule = each.value

  depends_on = [
    google_compute_network.networks,
  ]
}

module "firewall_rules" {
  source   = "r-teller/firewall-rules/google"
  for_each = local.firewall_rules

  project_id = var.project_id
  network    = each.value.network

  firewall_rule = each.value

  depends_on = [
    google_compute_network.networks,
  ]
}