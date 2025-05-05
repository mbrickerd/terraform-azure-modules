locals {
  naming_convention        = "${var.name}-${var.environment}"
  name                     = "kv-${local.naming_convention}"
  diagnostic_settings_name = "diag-${local.naming_convention}"
  private_endpoint_name    = "kv-endpoint-${local.naming_convention}"
  private_sc_name          = "kv-sc-${local.naming_convention}"
  tags                     = merge(var.tags, { environment = var.environment })
}
