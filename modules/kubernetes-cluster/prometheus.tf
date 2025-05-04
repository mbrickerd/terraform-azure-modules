resource "azurerm_monitor_workspace" "prometheus" {
  count = var.enable_prometheus ? 1 : 0

  name                = local.prometheus_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = local.prometheus_tags
}

resource "azurerm_monitor_data_collection_endpoint" "prometheus_endpoint" {
  count = var.enable_prometheus ? 1 : 0

  resource_group_name = var.resource_group_name
  name                = local.prometheus_endpoint_name
  location            = var.location
  kind                = "Linux"

  tags = local.prometheus_tags
}

resource "azurerm_monitor_data_collection_rule" "prometheus_rule" {
  count = var.enable_prometheus ? 1 : 0

  name                        = local.prometheus_rule_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  kind                        = "Linux"
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.prometheus_endpoint[0].id

  destinations {
    monitor_account {
      monitor_account_id = azurerm_monitor_workspace.prometheus[0].id
      name               = "MonitoringAccount1"
    }
  }

  data_flow {
    destinations = ["MonitoringAccount1"]
    streams      = ["Microsoft-PrometheusMetrics"]
  }

  tags = local.prometheus_tags
}

resource "azurerm_monitor_data_collection_rule" "additional_prometheus_rules" {
  count = var.enable_prometheus ? length(var.additional_prometheus_rules) : 0

  name                        = "${local.prometheus_rule_name}-${var.additional_prometheus_rules[count.index].name}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  kind                        = "Linux"
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.prometheus_endpoint[0].id
  description                 = var.additional_prometheus_rules[count.index].description

  destinations {
    monitor_account {
      monitor_account_id = azurerm_monitor_workspace.prometheus[0].id
      name               = "MonitoringAccount1"
    }
  }

  data_flow {
    destinations = ["MonitoringAccount1"]
    streams      = ["Microsoft-PrometheusMetrics"]
  }

  tags = local.prometheus_tags
}

resource "azurerm_monitor_data_collection_rule_association" "prometheus_rule_association" {
  count = var.enable_prometheus ? 1 : 0

  name                    = local.prometheus_rule_association_name
  target_resource_id      = azurerm_kubernetes_cluster.this.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.prometheus_rule[0].id
  description             = "Association for Prometheus metrics from AKS."
}

resource "azurerm_monitor_data_collection_rule_association" "additional_prometheus_rule_associations" {
  count = var.enable_prometheus ? length(var.additional_prometheus_rules) : 0

  name                    = "${local.prometheus_rule_association_name}-${var.additional_prometheus_rules[count.index].name}"
  target_resource_id      = azurerm_kubernetes_cluster.this.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.additional_prometheus_rules[count.index].id
  description             = "Association for additional Prometheus metrics: ${var.additional_prometheus_rules[count.index].name}"
}
