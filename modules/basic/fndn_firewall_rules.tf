locals {

  shared_firewall_rules_path = "./shared_firewall_rules"
  shared_firewall_rules_sets = fileset(local.shared_firewall_rules_path, "*.json")
  shared_firewall_rules = flatten([for rules in local.shared_firewall_rules_sets : [
    for rule in jsondecode(file("${local.shared_firewall_rules_path}/${rules}")) :
    merge(rule, { fileName = split(".", rules)[0] })
  ]])

  shared_network_firewall_rule_map = merge([for key, value in local.networks : {
    for rule in local.shared_firewall_rules : "${rule.fileName}-${key}-${rule.id}" => merge(rule, { network = key })
  }]...)

  firewall_rules = merge([
    for network in local.network_configs : {
      for firewall_rule in network.firewall_rules : "${local.prefix}--${local.environment}--${network.name}--${firewall_rule.id}" => merge(
        firewall_rule, {
          fileName = "rule"
          network  = "${local.prefix}-${local.environment}-vpc-${network.name}",
        }
      )
    }
  ]...)
}

module "shared_firewall_rules" {
  source   = "r-teller/firewall-rules/google"
  for_each = local.shared_network_firewall_rule_map

  project_id = local.project_id
  network    = each.value.network

  firewall_rule = each.value

  depends_on = [
    google_compute_network.networks,
  ]
}

module "firewall_rules" {
  source   = "r-teller/firewall-rules/google"
  for_each = local.firewall_rules

  project_id = local.project_id
  network    = each.value.network

  firewall_rule = each.value

  depends_on = [
    google_compute_network.networks,
  ]
}