resource "azurerm_key_vault" "this" {
  resource_group_name           = var.resource_group_name
  name                          = local.name
  location                      = var.location
  enabled_for_disk_encryption   = var.enabled_for_disk_encryption
  tenant_id                     = var.tenant_id
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  sku_name                      = var.sku_name
  public_network_access_enabled = var.public_network_access_enabled
  enable_rbac_authorization     = true

  dynamic "network_acls" {
    for_each = var.network_acls != null ? [var.network_acls] : []
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }

  tags = local.tags
}

resource "azurerm_role_assignment" "rbac_assignments" {
  for_each = { for assignment in var.rbac_assignments : assignment.role_name => assignment }

  scope                = azurerm_key_vault.this.id
  role_definition_name = each.value.role_name
  principal_id         = each.value.principal_id

  # Skip service principals that might not exist yet (like managed identities)
  skip_service_principal_aad_check = true
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.diagnostic_settings != null ? 1 : 0

  name                           = local.diagnostic_settings_name
  target_resource_id             = azurerm_key_vault.this.id
  log_analytics_workspace_id     = var.diagnostic_settings.log_analytics_workspace_id
  eventhub_name                  = var.diagnostic_settings.eventhub_name
  eventhub_authorization_rule_id = var.diagnostic_settings.eventhub_authorization_rule_id
  storage_account_id             = var.diagnostic_settings.storage_account_id

  dynamic "enabled_log" {
    for_each = var.diagnostic_settings.log_categories
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = var.diagnostic_settings.metric_categories
    content {
      category = metric.value
    }
  }
}

resource "azurerm_private_endpoint" "this" {
  count = var.private_endpoint_enabled ? 1 : 0

  name                = local.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = local.private_sc_name
    private_connection_resource_id = azurerm_key_vault.this.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_id != null ? [1] : []
    content {
      name                 = "${local.name}-dzg"
      private_dns_zone_ids = [var.private_dns_zone_id]
    }
  }

  tags = local.tags
}
