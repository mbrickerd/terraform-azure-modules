resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix != null ? var.dns_prefix : var.cluster_name
  kubernetes_version  = var.kubernetes_version
  node_resource_group = var.node_resource_group
  sku_tier            = var.sku_tier

  default_node_pool {
    name            = var.default_node_pool.name
    vm_size         = var.default_node_pool.vm_size
    node_count      = var.default_node_pool.node_count
    min_count       = var.default_node_pool.enable_auto_scaling ? var.default_node_pool.min_count : null
    max_count       = var.default_node_pool.enable_auto_scaling ? var.default_node_pool.max_count : null
    vnet_subnet_id  = var.default_node_pool.vnet_subnet_id
    zones           = var.default_node_pool.zones
    os_disk_size_gb = var.default_node_pool.os_disk_size_gb
    os_disk_type    = var.default_node_pool.os_disk_type
    tags            = merge(var.tags, var.default_node_pool.tags)
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = var.network_profile.network_plugin
    network_policy    = var.network_profile.network_policy
    load_balancer_sku = var.network_profile.load_balancer_sku
    service_cidr      = var.network_profile.service_cidr
    dns_service_ip    = var.network_profile.dns_service_ip
    outbound_type     = var.network_profile.outbound_type
  }

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.admin_group_object_ids
    azure_rbac_enabled     = var.azure_rbac_enabled
  }

  dynamic "key_vault_secrets_provider" {
    for_each = var.enable_key_vault_secrets_provider ? [1] : []
    content {
      secret_rotation_enabled  = true
      secret_rotation_interval = "2m"
    }
  }

  dynamic "oms_agent" {
    for_each = var.log_analytics_workspace_id != null ? [1] : []
    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      kubernetes_version,
      default_node_pool[0].node_count
    ]
  }
}
