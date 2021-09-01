
variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "firewall_name" {
  type = string
}

variable "bootstrap_files_staged" {
  type = bool
}
variable "ssh_key" {
  type = string
}
variable "block_project_ssh_keys" {
  type    = bool
  default = true
}
variable "mgmt_interface_swap" {
  type    = string
  default = "enable"
}
variable "interfaces" {

}
variable "deletion_protection" {
  type    = bool
  default = false
}
variable "tags" {
  type    = list(string)
  default = []
}
variable "machine_type" {
  type    = string
  default = "e2-standard-8"
}

variable "scopes" {
  type = list(string)
  default = [
    "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}

variable "image" {
  default = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-bundle1-909"
}