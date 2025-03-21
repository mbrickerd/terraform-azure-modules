resource "azuread_application" "this" {
  display_name = var.display_name
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.id
}

resource "azurerm_role_assignment" "this" {
  scope                = local.scope
  role_definition_name = var.role_definition_name
  principal_id         = azuread_service_principal.this.id
}
