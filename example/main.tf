locals {
  project_id  = "rteller-demo-host-aaaa"
  prefix      = "test" // Make optional
  environment = ""     // Make optional

  network_config_path = "./network_config"
  network_config_sets = fileset(local.network_config_path, "*.json")
  network_configs = flatten([for networks in local.network_config_sets : [
    for network in jsondecode(file("${local.network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])
}

module "network" {
  source  = "r-teller/foundation-network/google"
  version = "~> 0.11.0"

  project_id      = local.project_id
  prefix          = local.prefix
  environment     = "cases"
  network_configs = local.network_configs
}
