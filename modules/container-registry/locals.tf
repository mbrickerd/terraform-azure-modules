locals {
  name = "acr${var.name}${var.environment}"
  tags = merge(var.tags, { environment = var.environment })
}
