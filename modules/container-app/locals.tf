locals {
  law_name = "law-${var.name}-${var.environment}"
  cae_name = "cae-${var.name}-${var.environment}"
  app_name = "app-${var.name}-${var.environment}"
  tags     = merge(var.tags, { environment = var.environment })
}
