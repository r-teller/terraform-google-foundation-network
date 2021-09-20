locals {
  project_id = "rteller-demo-host-aaaa"
  prefix     = "ngfw-poc"

  prod_network_config_path = "./networks_prod"
  prod_network_config_sets = fileset(local.prod_network_config_path, "*.json")
  prod_network_configs = flatten([for networks in local.prod_network_config_sets : [
    for network in jsondecode(file("${local.prod_network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])

  dev_network_config_path = "./networks"
  dev_network_config_sets = fileset(local.dev_network_config_path, "*.json")
  dev_network_configs = flatten([for networks in local.dev_network_config_sets : [
    for network in jsondecode(file("${local.dev_network_config_path}/${networks}")) :
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
  environment           = "prod"
  network_configs       = local.prod_network_configs
  shared_firewall_rules = local.shared_firewall_rules
}


module "basic_foundation_dev" {
  source  = "r-teller/foundation-network/google//modules/basic"
  version = ">= 0.0.0"

  project_id            = local.project_id
  prefix                = local.prefix
  environment           = "dev"
  network_configs       = local.prod_network_configs
  shared_firewall_rules = local.shared_firewall_rules
}