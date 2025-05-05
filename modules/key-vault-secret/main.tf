resource "azurerm_key_vault_secret" "this" {
  for_each = var.secrets

  name            = each.key
  value           = each.value.content
  key_vault_id    = var.key_vault_id
  content_type    = try(each.value.content_type, null)
  expiration_date = local.secrets[each.key].expiration_date
  tags            = try(each.value.tags, null)

  lifecycle {
    ignore_changes = [
      value,
      expiration_date # Allow external updates without Terraform overwriting
    ]
  }
}
