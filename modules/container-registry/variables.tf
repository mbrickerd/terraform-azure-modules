variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry."
  type        = string
}

variable "name" {
  description = "The name of the Container Registry."
  type        = string
}

variable "environment" {
  description = "Specifies the environment the Container App belongs to."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "acc", "stg", "prd", "mgmt", "shared", "common"], var.environment)
    error_message = "Invalid value for environment. Must be one of: `dev`, `tst`, `acc`, `stg`, `prd`, `mgmt`, `shared`, `common`."
  }
}

variable "location" {
  description = "The Azure region where the Container Registry will be created."
  type        = string
}

variable "sku" {
  description = "The SKU name of the Container Registry. Possible values are `Basic`, `Standard`, `Premium`, `Classic`."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium", "Classic"], var.sku)
    error_message = "Invalid SKU value. Must be one of: `Basic`, `Standard`, `Premium`, `Classic`."
  }
}

variable "admin_enabled" {
  description = "Enable admin user for the Container Registry."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for the Container Registry. Defaults to `false` for security."
  type        = bool
  default     = false
}

variable "quarantine_policy_enabled" {
  description = "Enable quarantine policy for the Container Registry. Defaults to `true` for security."
  type        = bool
  default     = true
}

variable "georeplications" {
  description = "A list of Azure locations where the Container Registry should be geo-replicated."
  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool, true)
    tags                    = optional(map(string), {})
  }))
  default = [
    {
      location                = "westeurope"
      zone_redundancy_enabled = true
      tags                    = {}
    }
  ]
}

variable "network_rule_set" {
  description = "The network rule set for the Container Registry."
  type = object({
    default_action = optional(string, "Deny")
    ip_rules = optional(list(object({
      action   = string
      ip_range = string
    })), [])
    virtual_network_rules = optional(list(object({
      action    = string
      subnet_id = string
    })), [])
  })
  default = {
    default_action        = "Deny",
    ip_rules              = [],
    virtual_network_rules = []
  }
}

variable "encryption" {
  description = "The encryption configuration for the Container Registry."
  type = object({
    enabled            = optional(bool, false)
    identity_client_id = optional(string)
    key_vault_key_id   = optional(string)
  })
  default = {
    enabled = false
  }
}

variable "identity" {
  description = "The managed identity configuration for the Container Registry."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "data_endpoint_enabled" {
  description = "Whether to enable dedicated data endpoints for the Container Registry."
  type        = bool
  default     = true
}

variable "zone_redundancy_enabled" {
  description = "Whether to enable zone redundancy for the Container Registry."
  type        = bool
  default     = true
}
