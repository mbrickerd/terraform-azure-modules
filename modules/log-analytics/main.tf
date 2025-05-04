resource "azurerm_log_analytics_workspace" "this" {
  resource_group_name = var.resource_group_name
  name                = local.name
  location            = var.location
  sku                 = var.sku
  retention_in_days   = var.retention_in_days

  tags = local.tags
}

resource "azurerm_log_analytics_solution" "this" {
  count = var.enable_container_insights ? 1 : 0

  resource_group_name   = var.resource_group_name
  solution_name         = "ContainerInsights"
  location              = var.location
  workspace_resource_id = azurerm_log_analytics_workspace.this.id
  workspace_name        = azurerm_log_analytics_workspace.this.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
