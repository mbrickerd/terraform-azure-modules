resource "azurerm_dashboard_grafana" "grafana" {
  count = var.enable_grafana ? 1 : 0

  resource_group_name   = var.resource_group_name
  name                  = local.grafana_name
  location              = var.location
  grafana_major_version = var.grafana_major_version

  identity {
    type = "SystemAssigned"
  }

  azure_monitor_workspace_integrations {
    resource_id = local.prometheus_workspace_id
  }

  tags = local.grafana_tags
}

resource "azurerm_kubernetes_cluster_extension" "prometheus" {
  count = var.enable_prometheus ? 1 : 0

  name           = "azure-monitor-metrics"
  cluster_id     = azurerm_kubernetes_cluster.this.id
  extension_type = "microsoft.azuremonitor.containers.monitoring"

  configuration_settings = {
    "logAnalyticsWorkspaceResourceID" = var.log_analytics_workspace_id
    "prometheusIntegration"           = "enabled"
  }

  depends_on = [azurerm_monitor_data_collection_rule_association.prometheus_rule_association]
}
