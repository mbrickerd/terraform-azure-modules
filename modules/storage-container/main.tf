resource "azurerm_storage_container" "this" {
  name                              = var.name
  storage_account_id                = var.storage_account_id
  container_access_type             = var.container_access_type
  default_encryption_scope          = var.default_encryption_scope
  metadata                          = var.metadata
  encryption_scope_override_enabled = local.encryption_scope_override_enabled
}
