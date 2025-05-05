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
