variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Kubernetes cluster should exist"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster"
  type        = string
  default     = null
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS cluster"
  type        = string
  default     = null
}

variable "node_resource_group" {
  description = "The name of the Resource Group where the Kubernetes nodes should exist"
  type        = string
  default     = null
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster"
  type        = string
  default     = "Free"
  validation {
    condition     = contains(["Free", "Standard"], var.sku_tier)
    error_message = "Possible values are Free or Standard."
  }
}

variable "default_node_pool" {
  description = "Default node pool configuration"
  type = object({
    name                = string
    vm_size             = string
    node_count          = number
    enable_auto_scaling = optional(bool, false)
    min_count           = optional(number, null)
    max_count           = optional(number, null)
    vnet_subnet_id      = optional(string, null)
    zones               = optional(list(string), null)
    os_disk_size_gb     = optional(number, 128)
    os_disk_type        = optional(string, "Managed")
    tags                = optional(map(string), {})
  })
  default = {
    name                = "default"
    vm_size             = "Standard_D2s_v3"
    node_count          = 1
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
    os_disk_size_gb     = 128
    os_disk_type        = "Managed"
    tags                = {}
  }
}

variable "node_pools" {
  description = "Additional node pools configuration"
  type = map(object({
    vm_size             = string
    node_count          = number
    enable_auto_scaling = optional(bool, false)
    min_count           = optional(number, null)
    max_count           = optional(number, null)
    vnet_subnet_id      = optional(string, null)
    zones               = optional(list(string), null)
    os_disk_size_gb     = optional(number, 128)
    os_disk_type        = optional(string, "Managed")
    os_type             = optional(string, "Linux")
    priority            = optional(string, "Regular")
    mode                = optional(string, "User")
    node_labels         = optional(map(string), {})
    node_taints         = optional(list(string), [])
    max_pods            = optional(number, 30)
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "network_profile" {
  description = "Network profile configuration"
  type = object({
    network_plugin     = string
    network_policy     = optional(string, null)
    load_balancer_sku  = optional(string, "standard")
    docker_bridge_cidr = optional(string, null)
    service_cidr       = optional(string, null)
    dns_service_ip     = optional(string, null)
    outbound_type      = optional(string, "loadBalancer")
  })
  default = {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }
}

variable "admin_group_object_ids" {
  description = "A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster"
  type        = list(string)
  default     = []
}

variable "azure_rbac_enabled" {
  description = "Is Role Based Access Control based on Azure AD enabled?"
  type        = bool
  default     = true
}

variable "enable_key_vault_secrets_provider" {
  description = "Enable the Key Vault secrets provider for the AKS cluster"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace which the OMS Agent should send data to"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
