output "id" {
  description = "The ID of the Key Vault secret"
  value       = azurerm_key_vault_secret.this.id
}

output "resource_id" {
  description = "The Resource ID of the Key Vault secret."
  value       = azurerm_key_vault_secret.this.resource_id
  sensitive   = true
}
