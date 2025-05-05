resource "azurerm_kubernetes_cluster" "this" {
  resource_group_name = var.resource_group_name
  name                = local.name
  location            = var.location
  dns_prefix          = local.dns_prefix
  kubernetes_version  = var.kubernetes_version
  sku_tier            = var.sku_tier

  default_node_pool {
    name                 = var.default_node_pool_name
    vm_size              = var.default_node_pool_vm_size
    auto_scaling_enabled = var.auto_scaling_enabled
    min_count            = local.min_count
    max_count            = local.max_count
    node_count           = local.node_count
    os_disk_size_gb      = var.os_disk_size_gb
    os_disk_type         = var.os_disk_type
    max_pods             = var.max_pods
    scale_down_mode      = var.scale_down_mode
    orchestrator_version = var.kubernetes_version
    zones                = var.availability_zones
    upgrade_settings {
      max_surge = var.max_surge
    }
  }

  identity {
    type = "SystemAssigned"
  }
  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id          = var.tenant_id
  }

  network_profile {
    network_plugin      = var.network_plugin
    network_plugin_mode = var.network_plugin_mode
    network_policy      = "calico"
    load_balancer_sku   = "standard"
    pod_cidr            = var.pod_cidr
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
    outbound_type       = "loadBalancer"
  }

  auto_scaler_profile {
    balance_similar_node_groups      = local.balance_similar_node_groups
    expander                         = local.expander
    max_graceful_termination_sec     = local.max_graceful_termination_sec
    new_pod_scale_up_delay           = local.new_pod_scale_up_delay
    scale_down_delay_after_add       = local.scale_down_delay_after_add
    scale_down_delay_after_delete    = local.scale_down_delay_after_delete
    scale_down_delay_after_failure   = local.scale_down_delay_after_failure
    scale_down_utilization_threshold = local.scale_down_utilization_threshold
    scan_interval                    = local.scan_interval
    skip_nodes_with_local_storage    = local.skip_nodes_with_local_storage
    skip_nodes_with_system_pods      = local.skip_nodes_with_system_pods
  }

  local_account_disabled = var.local_account_disabled
  node_resource_group    = local.node_resource_group

  oidc_issuer_enabled          = true
  workload_identity_enabled    = true
  azure_policy_enabled         = var.azure_policy_enabled
  image_cleaner_enabled        = true
  image_cleaner_interval_hours = 168

  maintenance_window {
    allowed {
      day   = var.maintenance_window_day
      hours = var.maintenance_window_hours
    }
  }

  dynamic "key_vault_secrets_provider" {
    for_each = var.enable_key_vault_secrets_provider ? [1] : []
    content {
      secret_rotation_enabled  = var.key_vault_rotation_enabled
      secret_rotation_interval = var.key_vault_rotation_interval
    }
  }

  dynamic "oms_agent" {
    for_each = var.log_analytics_workspace_id != null ? [1] : []
    content {
      log_analytics_workspace_id      = var.log_analytics_workspace_id
      msi_auth_for_monitoring_enabled = true
    }
  }

  storage_profile {
    blob_driver_enabled         = var.blob_driver_enabled
    disk_driver_enabled         = true
    file_driver_enabled         = true
    snapshot_controller_enabled = true
  }

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count,
      kubernetes_version,
      tags
    ]
  }

  tags = var.tags
}
