output "id" {
  description = "The ID of the user assigned identity."
  value       = azurerm_user_assigned_identity.this.id
}

output "principal_id" {
  description = "The principal ID (object ID) of the user assigned identity."
  value       = azurerm_user_assigned_identity.this.principal_id
}

output "client_id" {
  description = "The client ID of the user assigned identity."
  value       = azurerm_user_assigned_identity.this.client_id
}

output "tenant_id" {
  description = "The tenant ID of the user assigned identity."
  value       = azurerm_user_assigned_identity.this.tenant_id
}
