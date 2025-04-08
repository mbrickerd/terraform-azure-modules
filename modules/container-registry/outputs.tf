output "id" {
  description = "The ID of the Container Registry."
  value       = azurerm_container_registry.this.id
}

output "name" {
  description = "The name of the Container Registry."
  value       = azurerm_container_registry.this.name
}

output "login_server" {
  description = "The URL that can be used to log into the Container Registry."
  value       = azurerm_container_registry.this.login_server
}

output "admin_username" {
  description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.this.admin_username
}

output "admin_password" {
  description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
  value       = azurerm_container_registry.this.admin_password
  sensitive   = true
}

output "identity" {
  description = "The identity of the Container Registry."
  value       = azurerm_container_registry.this.identity
}
