variable "resource_group_name" {
  description = "The name of the resource group where the managed identity should be created."
  type        = string
}

variable "name" {
  description = "The name of the managed identity."
  type        = string
}

variable "environment" {
  description = "Specifies the environment the AKS cluster belongs to."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "acc", "stg", "prd", "mgmt", "shared", "common"], var.environment)
    error_message = "Invalid value for environment. Must be one of: `dev`, `tst`, `acc`, `stg`, `prd`, `mgmt`, `shared`, `common`."
  }
}

variable "service" {
  description = "The service the managed identity belongs to."
  type        = string
}

variable "location" {
  description = "The Azure location where the managed identity should be created."
  type        = string
}

variable "role_assignments" {
  description = "A list of role assignments to create for the managed identity."
  type = list(object({
    scope                = string
    role_definition_name = string
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
