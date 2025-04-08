locals {
  name = "app-${var.name}-${var.environment}"
  tags = merge(var.tags, { environment = var.environment })
}
