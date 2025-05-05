resource "azurerm_key_vault_secret" "this" {
  name            = var.name
  value           = var.content
  key_vault_id    = var.key_vault_id
  content_type    = var.content_type
  expiration_date = var.expiration_date
  tags            = var.tags

  lifecycle {
    ignore_changes = [
      value,
      expiration_date
    ]
  }
}
