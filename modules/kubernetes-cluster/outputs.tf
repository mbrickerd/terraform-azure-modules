output "id" {
  description = "The Kubernetes Managed Cluster ID"
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "The Kubernetes Managed Cluster name"
  value       = azurerm_kubernetes_cluster.this.name
}

output "kube_config" {
  description = "A kube_config block as documented"
  value       = azurerm_kubernetes_cluster.this.kube_config
  sensitive   = true
}

output "kube_config_raw" {
  description = "Raw Kubernetes config for the admin user"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "node_resource_group" {
  description = "The auto-generated Resource Group which contains the Kubernetes resources"
  value       = azurerm_kubernetes_cluster.this.node_resource_group
}

output "kubelet_identity" {
  description = "The Kubelet identity block"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity
}

output "identity" {
  description = "The identity block of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.identity
}
