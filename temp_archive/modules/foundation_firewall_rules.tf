locals {
  defaults_firewall_rule = {
    priority = 1000
    disabled = false
  }
  _firewall_rules = flatten([for network in var.network_configs : [
    for firewall_rule in network.firewall_rules : {
      id             = firewall_rule.id
      network        = "${var.prefix}-${var.environment}-vpc-${network.name}"
      network_name = network.name

      priority       = try(firewall_rule.priority, 1000)
      rule_action    = lower(firewall_rule.action)
      rule_direction = upper(try(firewall_rule.direction, "ingress"))
      disabled = try(firewall_rule.disabled,false)

      source_service_accounts = [for x in firewall_rule.sources : x if length(split("@", x)) > 1 && !can(cidrnetmask(x))]
      source_tags             = [for x in firewall_rule.sources : x if length(split("@", x)) < 2 && !can(cidrnetmask(x))]
      source_cidrs            = [for x in firewall_rule.sources : x if can(cidrnetmask(x))]

      target_service_accounts = [for x in firewall_rule.targets : x if length(split("@", x)) > 1 && !can(cidrnetmask(x))]
      target_tags             = [for x in firewall_rule.targets : x if length(split("@", x)) < 2 && !can(cidrnetmask(x))]
      target_cidrs            = [for x in firewall_rule.targets : x if can(cidrnetmask(x))]

      log_config = try(firewall_rule.log_config, "DISABLED")
      rules      = try(firewall_rule.rules, null)
    }
  ] if can(network.firewall_rules)])

  firewall_rules = { for firewall_rule in local._firewall_rules : "${firewall_rule.id}-${uuidv5("x500","PREFIX=${var.prefix},ENVIRONMENT=${var.environment},NETWORK=${firewall_rule.network_name},ID=${firewall_rule.id}")}" =>
    merge(firewall_rule, {
      source_ranges = length(concat(firewall_rule.source_service_accounts, firewall_rule.source_tags, firewall_rule.source_cidrs)) > 0 ? firewall_rule.source_cidrs : ["0.0.0.0/0"]
      target_ranges = length(concat(firewall_rule.target_service_accounts, firewall_rule.target_tags, firewall_rule.target_cidrs)) > 0 ? firewall_rule.target_cidrs : ["0.0.0.0/0"]
    })
  }
}

resource "google_compute_firewall" "firewall_rule" {
  for_each = local.firewall_rules
  name     = each.key
  project  = var.project_id
  network  = each.value.network

  direction               = each.value.rule_direction
  disabled                = each.value.disabled
  priority                = each.value.priority
  description             = try(each.value.description, null)
  source_ranges           = length(each.value.source_ranges) > 0 && each.value.rule_direction == "INGRESS" ? each.value.source_ranges : length(each.value.source_ranges) == 0 && each.value.rule_direction == "INGRESS" ? [] : null
  destination_ranges      = length(each.value.target_ranges) > 0 && each.value.rule_direction == "EGRESS" ? each.value.target_ranges : length(each.value.target_ranges) == 0 && each.value.rule_direction == "EGRESS" ? [] : null
  source_tags             = length(each.value.source_tags) > 0 && each.value.rule_direction == "INGRESS" ? each.value.source_tags : null
  source_service_accounts = length(each.value.source_service_accounts) > 0 && each.value.rule_direction == "INGRESS" ? each.value.source_service_accounts : null
  target_tags             = length(each.value.target_tags) > 0 && each.value.rule_direction == "INGRESS" ? each.value.target_tags : length(each.value.source_tags) > 0 && each.value.rule_direction == "EGRESS" ? each.value.source_tags : null
  target_service_accounts = length(each.value.target_service_accounts) > 0 && each.value.rule_direction == "INGRESS" ? each.value.target_service_accounts : length(each.value.source_service_accounts) > 0 && each.value.rule_direction == "EGRESS" ? each.value.source_service_accounts : null

  dynamic "log_config" {
    for_each = can(each.value.firewall_rule.log_config) ? upper(each.value.firewall_rule.log_config) != "DISABLED" ? [1] : [] : []
    content {
      metadata = each.value.firewall_rule.log_config
    }
  }
  dynamic "allow" {
    for_each = [for rule in each.value.rules : rule if each.value.rule_action == "allow"]
    iterator = rule
    content {
      protocol = lower(rule.value.protocol)
      ports    = rule.value.ports
    }
  }
  dynamic "deny" {
    for_each = [for rule in each.value.rules : rule if each.value.rule_action == "deny"]
    iterator = rule
    content {
      protocol = lower(rule.value.protocol)
      ports    = rule.value.ports
    }
  }

  depends_on = [
    google_compute_network.networks
  ]
}