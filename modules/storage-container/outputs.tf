output "id" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.this.id
}

output "name" {
  description = "The name of the Storage Container."
  value       = azurerm_storage_container.this.name
}

output "has_immutability_policy" {
  description = "Whether there is an Immutability Policy configured on this Storage Container."
  value       = azurerm_storage_container.this.has_immutability_policy
}

output "has_legal_hold" {
  description = "Whether there is a Legal Hold configured on this Storage Container."
  value       = azurerm_storage_container.this.has_legal_hold
}
