locals {
  naming_convention = "${var.service}-${var.name}-${var.environment}"
  name              = "mi-${local.naming_convention}"
  tags              = merge(var.tags, { environment = var.environment })
}
