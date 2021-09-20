locals {
  project_id  = "rteller-demo-host-aaaa"
  prefix      = "ngfw-poc"
  environment = "prod"

  network_config_path = "./networks"
  network_config_sets = fileset(local.network_config_path, "*.json")
  network_configs = flatten([for networks in local.network_config_sets : [
    for network in jsondecode(file("${local.network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])
}