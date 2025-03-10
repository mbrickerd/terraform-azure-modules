locals {
  name                 = "log-${var.prefix}-${var.name}-${var.environment}"
  network_watcher_name = "watcher-${var.prefix}-${var.name}-${var.environment}"
  tags                 = merge(var.tags, { environment = var.environment })
}
