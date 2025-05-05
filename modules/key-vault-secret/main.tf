resource "azurerm_key_vault_secret" "this" {
  for_each = local.secret_metadata

  name            = each.value.name
  value           = local.secret_content[each.key]
  key_vault_id    = var.key_vault_id
  content_type    = each.value.content_type
  expiration_date = each.value.expiration_date
  tags            = each.value.tags

  lifecycle {
    ignore_changes = [
      value,
      expiration_date
    ]
  }
}
