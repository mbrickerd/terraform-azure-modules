locals {
  naming_convention = "${var.name}-${var.environment}"
  name              = "aks-${local.naming_convention}"
  dns_prefix        = var.dns_prefix != null ? var.dns_prefix : "dns-${local.naming_convention}"

  min_count  = var.auto_scaling_enabled ? var.min_count : null
  max_count  = var.auto_scaling_enabled ? var.max_count : null
  node_count = var.auto_scaling_enabled ? null : var.node_count

  balance_similar_node_groups      = lookup(var.auto_scaler_profile, "balance_similar_node_groups", false)
  expander                         = lookup(var.auto_scaler_profile, "expander", "random")
  max_graceful_termination_sec     = lookup(var.auto_scaler_profile, "max_graceful_termination_sec", "600")
  new_pod_scale_up_delay           = lookup(var.auto_scaler_profile, "new_pod_scale_up_delay", "0s")
  scale_down_delay_after_add       = lookup(var.auto_scaler_profile, "scale_down_delay_after_add", "10m")
  scale_down_delay_after_delete    = lookup(var.auto_scaler_profile, "scale_down_delay_after_delete", "10s")
  scale_down_delay_after_failure   = lookup(var.auto_scaler_profile, "scale_down_delay_after_failure", "3m")
  scale_down_utilization_threshold = lookup(var.auto_scaler_profile, "scale_down_utilization_threshold", "0.5")
  scan_interval                    = lookup(var.auto_scaler_profile, "scan_interval", "10s")
  skip_nodes_with_local_storage    = lookup(var.auto_scaler_profile, "skip_nodes_with_local_storage", false)
  skip_nodes_with_system_pods      = lookup(var.auto_scaler_profile, "skip_nodes_with_system_pods", true)

  node_resource_group = var.node_resource_group != null ? var.node_resource_group : "rg-aks-${local.naming_convention}"

  prometheus_name                  = "prometheus-${local.naming_convention}"
  prometheus_workspace_id          = var.enable_prometheus ? azurerm_monitor_workspace.prometheus[0].id : null
  prometheus_endpoint_name         = "prometheus-endpoint-${local.naming_convention}"
  prometheus_tags                  = merge(local.tags, { component = "prometheus" })
  prometheus_rule_name             = "prometheus-rule-${local.naming_convention}"
  prometheus_rule_association_name = "prometheus-rule-association-${local.naming_convention}"

  grafana_name = "gra-${local.naming_convention}"
  grafana_tags = merge(local.tags, { component = "grafana" })

  tags = merge(var.tags, { environment = var.environment })
}
