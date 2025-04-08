output "id" {
  description = "The ID of the Container App."
  value       = azurerm_container_app.this.id
}

output "name" {
  description = "The name of the Container App."
  value       = azurerm_container_app.this.name
}

output "outbound_ip_addresses" {
  description = "The outbound IP addresses of the Container App."
  value       = azurerm_container_app.this.outbound_ip_addresses
}

output "latest_revision_name" {
  description = "The name of the latest revision of the Container App."
  value       = azurerm_container_app.this.latest_revision_name
}

output "latest_revision_fqdn" {
  description = "The FQDN of the latest revision of the Container App."
  value       = azurerm_container_app.this.latest_revision_fqdn
}
