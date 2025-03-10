resource "azurerm_network_watcher_flow_log" "this" {
  #checkov:skip=CKV_AZURE_12:Ensure that Network Security Group Flow Log retention period is 'greater than 90 days'
  name                 = local.name
  network_watcher_name = local.network_watcher_name
  resource_group_name  = var.resource_group_name
  target_resource_id   = var.target_resource_id
  storage_account_id   = var.storage_account_id
  enabled              = var.enabled
  version              = var.flow_log_version
  location             = var.location
  tags                 = local.tags

  retention_policy {
    enabled = var.retention_policy.enabled
    days    = var.retention_policy.days
  }

  dynamic "traffic_analytics" {
    for_each = var.traffic_analytics != null ? [var.traffic_analytics] : []
    content {
      enabled               = traffic_analytics.value.enabled
      workspace_id          = traffic_analytics.value.workspace_id
      workspace_region      = traffic_analytics.value.workspace_region
      workspace_resource_id = traffic_analytics.value.workspace_resource_id
      interval_in_minutes   = traffic_analytics.value.interval_in_minutes
    }
  }
}
