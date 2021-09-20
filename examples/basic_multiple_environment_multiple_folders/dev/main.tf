locals {
  project_id  = "rteller-demo-host-aaaa"
  prefix      = "ngfw-poc"
  environment = "dev"

  network_config_path = "./networks"
  network_config_sets = fileset(local.network_config_path, "*.json")
  network_configs = flatten([for networks in local.network_config_sets : [
    for network in jsondecode(file("${local.network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])

  shared_firewall_rules_path = "./shared_firewall_rules"
  shared_firewall_rules_sets = fileset(local.shared_firewall_rules_path, "*.json")
  shared_firewall_rules = flatten([for rules in local.shared_firewall_rules_sets : [
    for rule in jsondecode(file("${local.shared_firewall_rules_path}/${rules}")) :
    merge(rule, { fileName = split(".", rules)[0] })
  ]])
}

module "basic_foundation_prod" {
  source  = "r-teller/foundation-network/google//modules/basic"
  version = ">= 0.0.0"

  project_id            = local.project_id
  prefix                = local.prefix
  environment           = local.environment
  network_configs       = local.network_configs
  shared_firewall_rules = local.shared_firewall_rules
}