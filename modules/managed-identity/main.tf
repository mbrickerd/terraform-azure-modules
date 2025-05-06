resource "azurerm_user_assigned_identity" "this" {
  resource_group_name = var.resource_group_name
  name                = local.name
  location            = var.location

  tags = local.tags
}

resource "azurerm_role_assignment" "this" {
  for_each = { for assignment in var.role_assignments : assignment.role_definition_name => assignment }

  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}
