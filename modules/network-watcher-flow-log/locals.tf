locals {
  name                 = "log-${var.name}-${var.environment}"
  network_watcher_name = "watcher-${var.name}-${var.environment}"
  tags                 = merge(var.tags, { environment = var.environment })
}
