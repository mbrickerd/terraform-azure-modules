output "ids" {
  description = "A mapping of secret names to their Key Vault IDs."
  value       = { for s in azurerm_key_vault_secret.this : s.name => s.id }
}

output "references" {
  description = "A mapping of secret names to their Key Vault resource references"
  value       = { for s in azurerm_key_vault_secret.this : s.name => s.resource_id }
  sensitive   = true
}
