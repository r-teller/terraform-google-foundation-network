variable "prefix" {
  type    = string
  default = "unknown"
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{0,9}$", var.prefix))
    error_message = "Variable `prefix` must be 1-10 characters in lenght: start with a lowercase letter: consist of lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  type    = string
  default = "prod"
  validation {
    condition     = can(regex("^[a-z0-9-]{0,9}$", var.environment))
    error_message = "Variable `environment` must be 1-10 characters in lenght: consist of lowercase letters, numbers, and hyphens."
  }
}

variable "project_id" {}

variable "network_configs" {}

variable "shared_firewall_rules" {}