resource "azurerm_key_vault_secret" "this" {
  for_each = local.metadata

  name            = each.key
  value           = local.secret_content[each.key]
  key_vault_id    = var.key_vault_id
  content_type    = try(each.value.content_type, null)
  expiration_date = each.value.expiration_date
  tags            = try(each.value.tags, null)

  lifecycle {
    ignore_changes = [
      value,
      expiration_date # Allow external updates without Terraform overwriting
    ]
  }
}
