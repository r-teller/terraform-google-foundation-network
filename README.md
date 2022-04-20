# Terraform Foundation for Deploying Networking in GCP
This module is designed to be driven from JSON and intended to configure all required aspects of Networking in GCP.

## Example
```terraform
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
  version = "~> 0.10.0"

  project_id      = local.project_id
  prefix          = local.prefix
  environment     = "cases"
  network_configs = local.network_configs
}

```

## Roadmap

### Supported GCP Networking Features

### Roadmap GCP Networking Features
- Cloud VPN
-- JSON Schema needs to be created to define expected properties
-- Integration with Secret Manger for storing VPN pre-shared keys
-- Creation of terraform logic

### Roadmap Module Features
- Explicit naming of resources
-- For example VPC, Firewall Rule, Cloud Router
- Deployment to existing VPCs
-- Currently this module expects to create the VPCs specified
- Specifying the project_id and prefix within the JSON spec

# Useful Links
## JSON Generator
https://r-teller.github.io/terraform-google-foundation-network

## JSON Schema Documentation
https://r-teller.github.io/terraform-google-foundation-network/documentation/

# Useful Tools
## JSON Schema Validator
https://github.com/ajv-validator/ajv
https://ajv.js.org/packages/ajv-cli.html
```bash
npm install -g ajv-cli

ajv validate -s .\json_generator\src\Schema\resolved.schema.json  -d .\test_cases\1_network\1a_network_single_name.json --strict=false
ajv validate -s .\json_generator\src\Schema\resolved.schema.json  -d .\test_cases\*\*.json --strict=false
```

## JSON Schema Dereferencer
https://github.com/davidkelley/json-dereference-cli
```bash
npm install -g json-dereference-cli
json-dereference -s my-schema.json -o compiled-schema.yaml
```

## React Widget from JSON Schema Generator
https://github.com/ui-schema/ui-schema

## JSON Schema to Documentation
https://github.com/coveooss/json-schema-for-humans
```bash
## Install as admin to make globally available
pip install json-schema-for-humans
```