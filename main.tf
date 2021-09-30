locals {
  project_id  = "rteller-demo-host-aaaa"
  prefix      = "test" // Make optional
  environment = ""     // Make optional

  test_cases__network__network_config_path = "./test_cases/1_network"
  test_cases__network__network_config_sets = fileset(local.test_cases__network__network_config_path, "*.json")
  test_cases__network__network_configs = flatten([for networks in local.test_cases__network__network_config_sets : [
    for network in jsondecode(file("${local.test_cases__network__network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])

  test_cases__subnetwork__network_config_path = "./test_cases/2_subnetwork"
  test_cases__subnetwork__network_config_sets = fileset(local.test_cases__subnetwork__network_config_path, "*.json")
  test_cases__subnetwork__network_configs = flatten([for networks in local.test_cases__subnetwork__network_config_sets : [
    for network in jsondecode(file("${local.test_cases__subnetwork__network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])

  test_cases__cloud_nat__network_config_path = "./test_cases/3_cloud_nat"
  test_cases__cloud_nat__network_config_sets = fileset(local.test_cases__cloud_nat__network_config_path, "*.json")
  test_cases__cloud_nat__network_configs = flatten([for networks in local.test_cases__cloud_nat__network_config_sets : [
    for network in jsondecode(file("${local.test_cases__cloud_nat__network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])


  test_cases__private_google_access__network_config_path = "./test_cases/4_private_google_access"
  test_cases__private_google_access__network_config_sets = fileset(local.test_cases__private_google_access__network_config_path, "*.json")
  test_cases__private_google_access__network_configs = flatten([for networks in local.test_cases__private_google_access__network_config_sets : [
    for network in jsondecode(file("${local.test_cases__private_google_access__network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])

  test_cases__route__network_config_path = "./test_cases/5_route"
  test_cases__route__network_config_sets = fileset(local.test_cases__route__network_config_path, "*.json")
  test_cases__route__network_configs = flatten([for networks in local.test_cases__route__network_config_sets : [
    for network in jsondecode(file("${local.test_cases__route__network_config_path}/${networks}")) :
    merge(network, { fileName = split(".", networks)[0] })
  ]])
}

module "test_cases__network" {
  count  = 0
  source = "./modules/basic"

  project_id      = local.project_id
  prefix          = local.prefix
  environment     = "cases"
  network_configs = local.test_cases__network__network_configs
}

module "test_cases__subnetwork" {
  count  = 0
  source = "./modules/basic"

  project_id      = local.project_id
  prefix          = local.prefix
  environment     = "cases"
  network_configs = local.test_cases__subnetwork__network_configs
}

module "test_cases__cloud_nat" {
  count  = 0
  source = "./modules/basic"

  project_id      = local.project_id
  prefix          = local.prefix
  environment     = "cases"
  network_configs = local.test_cases__cloud_nat__network_configs
}

module "test_cases__private_google_access" {
  count  = 0
  source = "./modules/basic"

  project_id      = local.project_id
  prefix          = local.prefix
  environment     = "cases"
  network_configs = local.test_cases__private_google_access__network_configs
}

module "test_cases__route" {
  count  = 1
  source = "./modules/basic"

  project_id      = local.project_id
  prefix          = local.prefix
  environment     = "cases"
  network_configs = local.test_cases__route__network_configs
}