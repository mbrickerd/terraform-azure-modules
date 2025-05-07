output "id" {
  description = "The ID of the EventHub."
  value       = azurerm_eventhub.this.id
}

output "name" {
  description = "The name of the EventHub."
  value       = azurerm_eventhub.this.name
}

output "partition_ids" {
  description = "The identifiers for partitions created for the EventHub."
  value       = azurerm_eventhub.this.partition_ids
}

output "consumer_groups" {
  description = "A mapping of consumer groups created for the EventHub."
  value = {
    for k, v in azurerm_eventhub_consumer_group.this : k => {
      id            = v.id
      name          = v.name
      user_metadata = v.user_metadata
    }
  }
}
