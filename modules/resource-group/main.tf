resource "azurerm_resource_group" "this" {
  name       = local.resource_group_name
  location   = var.location
  managed_by = var.managed_by
  tags       = local.tags
}
