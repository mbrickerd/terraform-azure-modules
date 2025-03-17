locals {
  resource_group_name = "rg-${var.name}-${var.environment}"
  tags                = merge(var.tags, { environment = var.environment })
}
