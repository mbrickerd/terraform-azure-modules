locals {
  naming_convention = "${var.name}-${var.environment}"
  name              = "evhb-${local.naming_convention}"
}
