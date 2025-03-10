variable "resource_group_name" {
  description = "The name of the Resource Group where the Network Watcher Flow Log should be created."
  type        = string
}

variable "prefix" {
  description = "The prefix name that will be used in the Network Watcher Flow Log naming convention."
  type        = string
}

variable "name" {
  description = "The base name that will be used in the Network Watcher Flow Log naming convention."
  type        = string
}

variable "environment" {
  description = "Specifies the environment the Network Watcher Flow Log belongs to."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "acc", "stg", "prd"], var.environment)
    error_message = "Invalid value for environment. Must be one of: `dev`, `tst`, `acc`, `stg`, `prd`."
  }
}

variable "location" {
  description = "Specifies the supported Azure location where the Network Watcher Flow Log exists."
  type        = string
  default     = "westeurope"
}

variable "target_resource_id" {
  description = "The ID of the Resource for which to enable flow logs for."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the Storage Account where flow logs are stored."
  type        = string
}

variable "enabled" {
  description = "Whether Network Flow Logging should be enabled."
  type        = bool
}

variable "retention_policy" {
  description = "Retention policy for flow logs"
  type = object({
    enabled = bool
    days    = number
  })

  validation {
    condition     = var.retention_policy.days > 0
    error_message = "The number of days to retain flow log records must be greater than 0."
  }
}

variable "traffic_analytics" {
  description = "Configuration for traffic analytics."
  type = object({
    enabled               = bool
    workspace_id          = string
    workspace_region      = string
    workspace_resource_id = string
    interval_in_minutes   = optional(number, 60)
  })
  default = null

  validation {
    condition     = var.traffic_analytics == null ? true : contains([60, 10], var.traffic_analytics.interval_in_minutes)
    error_message = "The interval_in_minutes must be either 10 or 60."
  }
}

variable "flow_log_version" {
  description = "The version (revision) of the flow log."
  type        = number
  default     = 1

  validation {
    condition     = contains([1, 2], var.flow_log_version)
    error_message = "Invalid value for version. Must be either 1 or 2."
  }
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Network Watcher Flow Log."
  type        = map(string)
  default     = {}
}
