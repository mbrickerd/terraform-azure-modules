locals {
  naming_convention = "${var.name}-${var.environment}"
  law_name          = "law-${local.naming_convention}"
  cae_name          = "cae-${local.naming_convention}"
  app_name          = "app-${local.naming_convention}"
  tags              = merge(var.tags, { environment = var.environment })
}
