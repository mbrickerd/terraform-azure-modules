output "id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.name
}

output "kube_config" {
  description = "The Kubernetes configuration."
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "kube_admin_config" {
  description = "The Kubernetes admin configuration."
  value       = azurerm_kubernetes_cluster.this.kube_admin_config_raw
  sensitive   = true
}

output "host" {
  description = "The Kubernetes cluster server host."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].host
  sensitive   = true
}

output "client_certificate" {
  description = "The client certificate for authenticating to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "The client key for authenticating to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The CA certificate for the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  sensitive   = true
}

output "fqdn" {
  description = "The FQDN of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.fqdn
}

output "node_resource_group" {
  description = "The resource group where the Kubernetes nodes are deployed."
  value       = azurerm_kubernetes_cluster.this.node_resource_group
}

output "identity_principal_id" {
  description = "The principal ID of the system assigned identity of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.identity[0].principal_id
}

output "kubelet_identity_object_id" {
  description = "The object ID of the AKS kubelet identity."
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

output "kubelet_identity_client_id" {
  description = "The client ID of the AKS kubelet identity."
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].client_id
}

output "key_vault_secrets_provider" {
  description = "The Key Vault Secrets Provider details."
  value = var.enable_key_vault_secrets_provider ? {
    secret_identity_client_id = azurerm_kubernetes_cluster.this.key_vault_secrets_provider[0].secret_identity[0].client_id
    secret_identity_object_id = azurerm_kubernetes_cluster.this.key_vault_secrets_provider[0].secret_identity[0].object_id
  } : null
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.oidc_issuer_url
}

output "prometheus_workspace_id" {
  description = "The ID of the Azure Monitor workspace for Prometheus."
  value       = var.enable_prometheus ? azurerm_monitor_workspace.prometheus[0].id : null
}

output "grafana_id" {
  description = "The ID of the Azure Managed Grafana instance."
  value       = var.enable_grafana ? azurerm_dashboard_grafana.grafana[0].id : null
}

output "grafana_endpoint" {
  description = "The endpoint URL of the Azure Managed Grafana instance."
  value       = var.enable_grafana ? azurerm_dashboard_grafana.grafana[0].endpoint : null
}
