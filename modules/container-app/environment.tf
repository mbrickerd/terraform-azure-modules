resource "azurerm_container_app_environment" "this" {
  name                       = local.cae_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  tags = local.tags
}
