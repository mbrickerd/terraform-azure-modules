locals {
  naming_convention = "${var.name}-${var.environment}"
  name              = "evhb-${local.naming_convention}"
  tags              = merge(var.tags, { environment = var.environment })
}
