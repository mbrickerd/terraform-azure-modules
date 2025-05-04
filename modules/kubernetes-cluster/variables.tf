variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
}

variable "name" {
  description = "The name of the AKS cluster."
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

variable "location" {
  description = "The Azure region where resources will be created. Defaults to `westeurope`."
  type        = string
  default     = "westeurope"
}

variable "node_resource_group" {
  description = "The name of the resource group where the Kubernetes nodes will reside."
  type        = string
  default     = null
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use. Defaults to `1.31.7`."
  type        = string
  default     = "1.31.7"
}

variable "dns_prefix" {
  description = "The DNS prefix specified when creating the managed cluster."
  type        = string
  default     = null
}

variable "sku_tier" {
  description = "The SKU tier for the AKS cluster. Defaults to `Free`."
  type        = string
  default     = "Free"
}

variable "default_node_pool_name" {
  description = "The name of the default node pool. Defaults to `agentpool`."
  type        = string
  default     = "agentpool"
}

variable "default_node_pool_vm_size" {
  description = "The size of the VM for the default node pool. Defaults to `Standard_A2_v2`."
  type        = string
  default     = "Standard_A2_v2"
}

variable "enable_auto_scaling" {
  description = "Whether to enable auto scaling for the default node pool. Defaults to `true`."
  type        = bool
  default     = true
}

variable "min_count" {
  description = "The minimum number of nodes in the default node pool when auto scaling is enabled. Defaults to `2`."
  type        = number
  default     = 2
}

variable "max_count" {
  description = "The maximum number of nodes in the default node pool when auto scaling is enabled. Defaults to `5`."
  type        = number
  default     = 5
}

variable "node_count" {
  description = "The number of nodes in the default node pool when auto scaling is disabled. Defaults to `3`."
  type        = number
  default     = 3
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk for each node in the node pool. Defaults to `128`."
  type        = number
  default     = 128
}

variable "os_disk_type" {
  description = "The type of OS disk for the node pool. Defaults to `Managed`."
  type        = string
  default     = "Managed"
}

variable "max_pods" {
  description = "The maximum number of pods that can run on a node. Defaults to `110`."
  type        = number
  default     = 110
}

variable "availability_zones" {
  description = "The list of availability zones to use for the default node pool. Defaults to `[1]`."
  type        = list(string)
  default     = ["1"]
}

variable "scale_down_mode" {
  description = "The scale down mode for the default node pool. Defaults to `Delete`."
  type        = string
  default     = "Delete"
}

variable "max_surge" {
  description = "The maximum surge for node pool upgrade. Defaults to `10%`."
  type        = string
  default     = "10%"
}

variable "network_plugin" {
  description = "The network plugin to use for networking. Defaults to `azure`."
  type        = string
  default     = "azure"
}

variable "network_plugin_mode" {
  description = "The network plugin mode. Defaults to `overlay`."
  type        = string
  default     = "overlay"
}

variable "pod_cidr" {
  description = "The CIDR for the pod network. Defaults to `10.244.0.0/16`."
  type        = string
  default     = "10.244.0.0/16"
}

variable "service_cidr" {
  description = "The CIDR for the service network. Defaults to `10.0.0.0/16`."
  type        = string
  default     = "10.0.0.0/16"
}

variable "dns_service_ip" {
  description = "The IP address within the service CIDR for the Kubernetes DNS service. Defaults to `10.0.0.10`."
  type        = string
  default     = "10.0.0.10"
}

variable "tenant_id" {
  description = "The tenant ID of the Azure Active Directory."
  type        = string
}

variable "auto_scaler_profile" {
  description = "The auto-scaler profile configuration."
  type        = map(string)
  default     = {}
}

variable "maintenance_window_day" {
  description = "Day of the week for the maintenance window"
  type        = string
  default     = "Saturday"

  validation {
    condition     = contains(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], var.maintenance_window_day)
    error_message = "The maintenance window day must be a valid day of the week."
  }
}

variable "maintenance_window_hours" {
  description = "Hours for the maintenance window (array of integers from 0-23)"
  type        = list(number)
  default     = [21, 22, 23]

  validation {
    condition     = length([for h in var.maintenance_window_hours : h if h >= 0 && h <= 23]) == length(var.maintenance_window_hours)
    error_message = "The maintenance window hours must be valid hours (0-23)."
  }
}

variable "local_account_disabled" {
  description = "Whether local accounts will be disabled. Defaults to `true`."
  type        = bool
  default     = true
}

variable "azure_policy_enabled" {
  description = "Whether to enable the Azure Policy add-on. Defaults to `false`."
  type        = bool
  default     = false
}

variable "enable_key_vault_secrets_provider" {
  description = "Whether to enable the Azure Key Vault Secrets Provider. Defaults to `true`."
  type        = bool
  default     = true
}

variable "key_vault_rotation_enabled" {
  description = "Whether to enable secrets rotation for the Key Vault Secrets Provider. Defaults to `false`."
  type        = bool
  default     = false
}

variable "key_vault_rotation_interval" {
  description = "The rotation poll interval for the Key Vault Secrets Provider. Defaults to `2m`."
  type        = string
  default     = "2m"
}

variable "blob_driver_enabled" {
  description = "Whether to enable the Blob CSI driver. Defaults to `false`."
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to send diagnostics."
  type        = string
}

variable "enable_prometheus" {
  description = "Whether to enable Azure Monitor managed service for Prometheus. Defaults to `true`."
  type        = bool
  default     = true
}

variable "additional_prometheus_rules" {
  description = "The list of additional Prometheus rules to create (besides the default rule)."
  type = list(object({
    name        = string
    description = string
  }))
  default = []
}

variable "enable_grafana" {
  description = "Whether to enable the Azure Managed Grafana instance. Defaults to `true`."
  type        = bool
  default     = true
}

variable "grafana_major_version" {
  description = "The major version of the Grafana instance. Defaults to `10`."
  type        = string
  default     = "10"
}

variable "tags" {
  description = "A mapping of tags to apply to all resources."
  type        = map(string)
  default     = {}
}
