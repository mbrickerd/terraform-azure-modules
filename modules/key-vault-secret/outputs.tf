output "ids" {
  description = "A mapping of secret names to their Key Vault IDs."
  value       = { for k, v in azurerm_key_vault_secret.secrets : k => v.id }
  sensitive   = true
}

output "expiration_dates" {
  description = "A mapping of secret names to their expiration dates."
  value       = { for k, v in azurerm_key_vault_secret.this : k => v.expiration_date }
}
