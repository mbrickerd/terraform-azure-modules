locals {
  name = "vnet-${var.name}-${var.environment}"
  tags = merge(var.tags, { environment = var.environment })
}
