resource "azurerm_eventhub_namespace" "this" {
  name                          = local.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  capacity                      = var.capacity
  auto_inflate_enabled          = var.auto_inflate_enabled
  dedicated_cluster_id          = var.dedicated_cluster_id
  maximum_throughput_units      = var.maximum_throughput_units
  local_authentication_enabled  = var.local_authentication_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "network_rulesets" {
    for_each = var.network_rulesets != null ? [var.network_rulesets] : []
    content {
      default_action                 = network_rulesets.value.default_action
      public_network_access_enabled  = network_rulesets.value.public_network_access_enabled
      trusted_service_access_enabled = network_rulesets.value.trusted_service_access_enabled

      dynamic "virtual_network_rule" {
        for_each = network_rulesets.value.virtual_network_rule != null ? network_rulesets.value.virtual_network_rule : []
        content {
          subnet_id                                       = virtual_network_rule.value.subnet_id
          ignore_missing_virtual_network_service_endpoint = virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint
        }
      }

      dynamic "ip_rule" {
        for_each = network_rulesets.value.ip_rule != null ? network_rulesets.value.ip_rule : []
        content {
          ip_mask = ip_rule.value.ip_mask
          action  = ip_rule.value.action
        }
      }
    }
  }

  timeouts {
    create = var.timeouts != null ? try(var.timeouts.create, null) : null
    update = var.timeouts != null ? try(var.timeouts.update, null) : null
    read   = var.timeouts != null ? try(var.timeouts.read, null) : null
    delete = var.timeouts != null ? try(var.timeouts.delete, null) : null
  }

  tags = merge(local.tags, var.tags)
}
