variable "resource_group_name" {
  description = "The name of the resource group where the Log Analytics workspace will be created."
  type        = string
}

variable "name" {
  description = "The name of the Log Analytics workspace."
  type        = string
}

variable "environment" {
  description = "The environment where the Log Analytics workspace will be created."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "acc", "stg", "prd", "mgmt", "shared", "common"], var.environment)
    error_message = "Invalid value for environment. Must be one of: `dev`, `tst`, `acc`, `stg`, `prd`, `mgmt`, `shared`, `common`."
  }
}

variable "location" {
  description = "The Azure region where the Log Analytics workspace will be created."
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics workspace. Default is `PerGB2018`."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The number of days to retain logs. Default is `30`."
  type        = number
  default     = 30
}

variable "enable_container_insights" {
  description = "Whether to enable Container Insights. Default is `true`."
  type        = bool
  default     = true
}



variable "tags" {
  description = "The mapping of tags to apply to the Log Analytics workspace."
  type        = map(string)
  default     = {}
}
