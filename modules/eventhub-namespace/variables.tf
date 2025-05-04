variable "resource_group_name" {
  description = "The name of the resource group in which to create the EventHub Namespace."
  type        = string
}

variable "name" {
  description = "The name of the EventHub Namespace."
  type        = string
}

variable "environment" {
  description = "Specifies the environment the EventHub Namespace belongs to."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "acc", "stg", "prd", "mgmt", "shared", "common"], var.environment)
    error_message = "Invalid value for environment. Must be one of: `dev`, `tst`, `acc`, `stg`, `prd`, `mgmt`, `shared`, `common`."
  }
}

variable "location" {
  description = "The location where the EventHub Namespace resources will be created."
  type        = string
}

variable "sku" {
  description = "Specifies which SKU tier to use for the EventHub Namespace. Default is `Standard`."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "Invalid value for sku. Must be one of: `Basic`, `Standard`, `Premium`."
  }
}

variable "capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis."
  type        = number
  default     = 1
}

variable "auto_inflate_enabled" {
  description = "Whether Auto Inflate is enabled."
  type        = bool
  default     = false
}

variable "dedicated_cluster_id" {
  description = "Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created."
  type        = string
  default     = null
}

variable "identity" {
  description = "An identity block with type and identity IDs."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "maximum_throughput_units" {
  description = "Specifies the maximum number of throughput units when Auto Inflate is enabled. Valid values range from 1 - 20."
  type        = number
  default     = null

  validation {
    condition     = var.auto_inflate_enabled ? var.maximum_throughput_units != null : true
    error_message = "maximum_throughput_units must be set when auto_inflate_enabled is true."
  }

  validation {
    condition     = var.auto_inflate_enabled ? var.maximum_throughput_units >= 1 && var.maximum_throughput_units <= 20 : true
    error_message = "maximum_throughput_units must be between 1 and 20 when auto_inflate_enabled is true."
  }
}

variable "network_rulesets" {
  description = "The network rulesets configuration."
  type = object({
    default_action                 = string
    public_network_access_enabled  = optional(bool)
    trusted_service_access_enabled = optional(bool)
    virtual_network_rule = optional(list(object({
      subnet_id                                       = string
      ignore_missing_virtual_network_service_endpoint = optional(bool)
    })))
    ip_rule = optional(list(object({
      ip_mask = string
      action  = optional(string)
    })))
  })
  default = null
}

variable "local_authentication_enabled" {
  description = "Whether SAS authentication is enabled for the EventHub Namespace. Default is `true`."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the EventHub Namespace. Default is `true`."
  type        = bool
  default     = true
}

variable "minimum_tls_version" {
  description = "The minimum supported TLS version for this EventHub Namespace. Valid values are: 1.0, 1.1 and 1.2. Default is `1.2`."
  type        = string
  default     = "1.2"

  validation {
    condition     = contains(["1.0", "1.1", "1.2"], var.minimum_tls_version)
    error_message = "Invalid value for minimum_tls_version. Must be one of: `1.0`, `1.1`, `1.2`."
  }
}

variable "timeouts" {
  description = "The timeouts for creating, updating, reading and deleting the EventHub Namespace"
  type = object({
    create = optional(string)
    update = optional(string)
    read   = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the EventHub Namespace resource."
  type        = map(string)
  default     = {}
}
