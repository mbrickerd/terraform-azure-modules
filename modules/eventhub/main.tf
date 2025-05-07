resource "azurerm_eventhub" "this" {
  name              = local.name
  namespace_id      = var.namespace_id
  partition_count   = var.partition_count
  message_retention = var.message_retention
  status            = var.status

  dynamic "capture_description" {
    for_each = var.capture_enabled ? [1] : []

    content {
      enabled             = true
      encoding            = var.capture_encoding
      interval_in_seconds = var.capture_interval_in_seconds
      size_limit_in_bytes = var.capture_size_limit_in_bytes
      skip_empty_archives = var.capture_skip_empty_archives

      destination {
        name                = "EventHubArchive.AzureBlockBlob"
        archive_name_format = var.capture_archive_name_format
        blob_container_name = var.capture_blob_container_name
        storage_account_id  = var.capture_storage_account_id
      }
    }
  }
}

resource "azurerm_eventhub_consumer_group" "this" {
  for_each = toset(var.consumer_groups)

  resource_group_name = var.resource_group_name
  name                = each.key
  eventhub_name       = azurerm_eventhub.this.name
  namespace_name      = var.namespace_name
  user_metadata       = lookup(var.consumer_groups_metadata, each.key, null)
}

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  scope                = azurerm_eventhub.this.id
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
}
