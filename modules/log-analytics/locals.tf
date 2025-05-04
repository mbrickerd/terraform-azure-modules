locals {
  naming_convention = "${var.name}-${var.environment}"
  name              = "law-${local.naming_convention}"
  tags              = merge(var.tags, { environment = var.environment })
}
