variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container App."
  type        = string
}

variable "name" {
  description = "The name of the Container App."
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
  description = "The location where the Container App resources will be created."
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_days" {
  description = "The retention period for the Log Analytics Workspace logs in days."
  type        = number
  default     = 30
}

variable "revision_mode" {
  description = "The revision mode of the Container App. Possible values are `Single` and `Multiple`."
  type        = string
  default     = "Single"
  validation {
    condition     = contains(["Single", "Multiple"], var.revision_mode)
    error_message = "Invalid revision_mode value. Must be one of: `Single` or `Multiple`."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "template" {
  description = "The template for the Container App."
  type = object({
    containers = list(object({
      name         = string
      image        = string
      cpu          = number
      memory       = string
      min_replicas = optional(number, 1)
      max_replicas = optional(number, 1)
      env = optional(list(object({
        name  = string
        value = string
      })), [])
      env_secret = optional(list(object({
        name        = string
        secret_name = string
      })), [])
      args    = optional(list(string), [])
      command = optional(list(string), [])
      probes = optional(list(object({
        type             = string
        http_get_path    = optional(string)
        initial_delay    = optional(number)
        interval_seconds = optional(number)
        timeout          = optional(number)
        failure_count    = optional(number)
        success_count    = optional(number)
      })), [])
    }))
    scale = optional(object({
      min_replicas = optional(number, 1)
      max_replicas = optional(number, 1)
      rules = optional(list(object({
        name = string
        http_scale_rule = optional(object({
          concurrent_requests = string
        }))
        custom_scale_rule = optional(object({
          authentication = list(object({
            secret_name       = string
            trigger_parameter = string
          }))
          metadata = map(string)
          type     = string
        }))
      })), [])
    }))
  })
}

variable "ingress" {
  description = "The ingress configuration for the Container App."
  type = object({
    external_enabled = optional(bool, false)
    target_port      = optional(number)
    transport        = optional(string, "auto")
    traffic_weight = optional(list(object({
      percentage      = number
      latest_revision = optional(bool, true)
      revision_suffix = optional(string)
    })), [])
    allow_insecure_connections = optional(bool, false)
    ip_restriction = optional(list(object({
      name             = string
      ip_address_range = string
      action           = string
      priority         = number
    })), [])
    custom_domain = optional(list(object({
      name                 = string
      certificate_name     = string
      certificate_password = optional(string)
      dns_zone_id          = optional(string)
      hostname             = string
    })), [])
  })
  default = null
}

variable "registry" {
  description = "The container registry configuration."
  type = list(object({
    server               = string
    identity             = optional(string)
    username             = optional(string)
    password_secret_name = optional(string)
  }))
  default = []
}

variable "secrets" {
  description = "The secrets configuration for the Container App."
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "identity" {
  description = "The managed identity configuration for the Container App."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "dapr" {
  description = "The Dapr configuration for the Container App."
  type = object({
    app_id       = string
    app_port     = number
    app_protocol = optional(string, "http")
  })
  default = null
}

variable "workload_profile_name" {
  description = "The name of the workload profile to use for the Container App."
  type        = string
  default     = null
}
