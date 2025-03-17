locals {
  name = "sa${replace(var.name, "-", "")}${var.environment}"
  tags = merge(var.tags, { environment = var.environment })
}
