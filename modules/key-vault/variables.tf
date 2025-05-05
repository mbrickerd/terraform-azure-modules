variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "environment" {
  description = "Specifies the environment the Key Vault belongs to. Defaults to `dev`."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "acc", "stg", "prd", "mgmt", "shared", "common"], var.environment)
    error_message = "Invalid value for environment. Must be one of: `dev`, `tst`, `acc`, `stg`, `prd`, `mgmt`, `shared`, `common`."
  }
}

variable "location" {
  description = "The location where the Key Vaultresources will be created. Defaults to `westeurope`."
  type        = string
  default     = "westeurope"
}

variable "tenant_id" {
  description = "The tenant ID of the Azure Active Directory."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Key Vault. Defaults to `standard`."
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "The number of days to retain deleted items (7-90). Defaults to `90`."
  type        = number
  default     = 90
}

variable "purge_protection_enabled" {
  description = "Whether to enable purge protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enabled_for_disk_encryption" {
  description = "Whether to enable disk encryption. Defaults to `false`."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether to enable public network access. Defaults to `false`."
  type        = bool
  default     = false
}

variable "network_acls" {
  description = "The network ACLs configuration. Recommended to restrict access to specific networks."
  type = object({
    bypass                     = string
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  default = {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }
}

variable "diagnostic_settings" {
  description = "The diagnostic settings configuration."
  type = object({
    log_analytics_workspace_id     = optional(string)
    eventhub_name                  = optional(string)
    eventhub_authorization_rule_id = optional(string)
    storage_account_id             = optional(string)
    log_categories                 = optional(list(string), [])
    metric_categories              = optional(list(string), [])
  })
  default = null
}

variable "rbac_assignments" {
  description = "The list of RBAC role assignments to be created for the Key Vault."
  type = list(object({
    role_name    = string
    principal_id = string
  }))
  default = []
}

variable "private_endpoint_enabled" {
  description = "Whether to enable private endpoint for the Key Vault. Defaults to `true`."
  type        = bool
  default     = true
}

variable "private_endpoint_subnet_id" {
  description = "The ID of the subnet to deploy the private endpoint into"
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone for Key Vault."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Key Vault resource."
  type        = map(string)
  default     = {}
}
