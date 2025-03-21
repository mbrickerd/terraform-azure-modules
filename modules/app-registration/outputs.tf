output "id" {
  description = "The object ID of the service principal"
  value       = azuread_service_principal.this.id
  sensitive   = false
}

output "application_id" {
  description = "The application ID (client ID) of the service principal"
  value       = azuread_service_principal.this.application_id
  sensitive   = false
}

output "display_name" {
  description = "The display name of the service principal"
  value       = azuread_service_principal.this.display_name
  sensitive   = false
}

output "client_id" {
  description = "The client ID (application ID) of the application associated with this service principal"
  value       = azuread_application.this.client_id
  sensitive   = false
}

output "client_secret" {
  description = "The client secret (password) of the service principal"
  value       = azuread_service_principal_password.this.value
  sensitive   = true
}

output "tenant_id" {
  description = "The tenant ID where the service principal was created"
  value       = data.azurerm_client_config.current.tenant_id
  sensitive   = false
}
