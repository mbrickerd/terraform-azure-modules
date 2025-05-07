locals {
  naming_convention = "${var.name}-${var.environment}"
  name              = "evhbns-${local.naming_convention}"
  tags              = merge(var.tags, { environment = var.environment })
}
