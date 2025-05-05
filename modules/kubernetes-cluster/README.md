<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dashboard_grafana.grafana](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dashboard_grafana) | resource |
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_monitor_data_collection_endpoint.prometheus_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_endpoint) | resource |
| [azurerm_monitor_data_collection_rule.prometheus_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule) | resource |
| [azurerm_monitor_data_collection_rule_association.prometheus_rule_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule_association) | resource |
| [azurerm_monitor_workspace.prometheus](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scaler_profile"></a> [auto\_scaler\_profile](#input\_auto\_scaler\_profile) | The auto-scaler profile configuration. | `map(string)` | `{}` | no |
| <a name="input_auto_scaling_enabled"></a> [auto\_scaling\_enabled](#input\_auto\_scaling\_enabled) | Whether to enable auto scaling for the default node pool. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The list of availability zones to use for the default node pool. Defaults to `[1]`. | `list(string)` | <pre>[<br/>  "1"<br/>]</pre> | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Whether to enable the Azure Policy add-on. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_blob_driver_enabled"></a> [blob\_driver\_enabled](#input\_blob\_driver\_enabled) | Whether to enable the Blob CSI driver. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | The name of the default node pool. Defaults to `agentpool`. | `string` | `"agentpool"` | no |
| <a name="input_default_node_pool_vm_size"></a> [default\_node\_pool\_vm\_size](#input\_default\_node\_pool\_vm\_size) | The size of the VM for the default node pool. Defaults to `Standard_A2_v2`. | `string` | `"Standard_A2_v2"` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | The DNS prefix specified when creating the managed cluster. | `string` | `null` | no |
| <a name="input_dns_service_ip"></a> [dns\_service\_ip](#input\_dns\_service\_ip) | The IP address within the service CIDR for the Kubernetes DNS service. Defaults to `10.0.0.10`. | `string` | `"10.0.0.10"` | no |
| <a name="input_enable_grafana"></a> [enable\_grafana](#input\_enable\_grafana) | Whether to enable the Azure Managed Grafana instance. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_enable_key_vault_secrets_provider"></a> [enable\_key\_vault\_secrets\_provider](#input\_enable\_key\_vault\_secrets\_provider) | Whether to enable the Azure Key Vault Secrets Provider. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_enable_prometheus"></a> [enable\_prometheus](#input\_enable\_prometheus) | Whether to enable Azure Monitor managed service for Prometheus. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Specifies the environment the AKS cluster belongs to. | `string` | `"dev"` | no |
| <a name="input_grafana_major_version"></a> [grafana\_major\_version](#input\_grafana\_major\_version) | The major version of the Grafana instance. Defaults to `10`. | `string` | `"10"` | no |
| <a name="input_key_vault_rotation_enabled"></a> [key\_vault\_rotation\_enabled](#input\_key\_vault\_rotation\_enabled) | Whether to enable secrets rotation for the Key Vault Secrets Provider. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_key_vault_rotation_interval"></a> [key\_vault\_rotation\_interval](#input\_key\_vault\_rotation\_interval) | The rotation poll interval for the Key Vault Secrets Provider. Defaults to `2m`. | `string` | `"2m"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of Kubernetes to use. Defaults to `1.31.7`. | `string` | `"1.31.7"` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | Whether local accounts will be disabled. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be created. Defaults to `westeurope`. | `string` | `"westeurope"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace to send diagnostics. | `string` | n/a | yes |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | Day of the week for the maintenance window | `string` | `"Saturday"` | no |
| <a name="input_maintenance_window_hours"></a> [maintenance\_window\_hours](#input\_maintenance\_window\_hours) | Hours for the maintenance window (array of integers from 0-23) | `list(number)` | <pre>[<br/>  21,<br/>  22,<br/>  23<br/>]</pre> | no |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | The maximum number of nodes in the default node pool when auto scaling is enabled. Defaults to `5`. | `number` | `5` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | The maximum number of pods that can run on a node. Defaults to `110`. | `number` | `110` | no |
| <a name="input_max_surge"></a> [max\_surge](#input\_max\_surge) | The maximum surge for node pool upgrade. Defaults to `10%`. | `string` | `"10%"` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | The minimum number of nodes in the default node pool when auto scaling is enabled. Defaults to `2`. | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the AKS cluster. | `string` | n/a | yes |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | The network plugin to use for networking. Defaults to `azure`. | `string` | `"azure"` | no |
| <a name="input_network_plugin_mode"></a> [network\_plugin\_mode](#input\_network\_plugin\_mode) | The network plugin mode. Defaults to `overlay`. | `string` | `"overlay"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes in the default node pool when auto scaling is disabled. Defaults to `3`. | `number` | `3` | no |
| <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group) | The name of the resource group where the Kubernetes nodes will reside. | `string` | `null` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | The size of the OS disk for each node in the node pool. Defaults to `128`. | `number` | `128` | no |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | The type of OS disk for the node pool. Defaults to `Managed`. | `string` | `"Managed"` | no |
| <a name="input_pod_cidr"></a> [pod\_cidr](#input\_pod\_cidr) | The CIDR for the pod network. Defaults to `10.244.0.0/16`. | `string` | `"10.244.0.0/16"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where resources will be created | `string` | n/a | yes |
| <a name="input_scale_down_mode"></a> [scale\_down\_mode](#input\_scale\_down\_mode) | The scale down mode for the default node pool. Defaults to `Delete`. | `string` | `"Delete"` | no |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | The CIDR for the service network. Defaults to `10.0.0.0/16`. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU tier for the AKS cluster. Defaults to `Free`. | `string` | `"Free"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant ID of the Azure Active Directory. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | The client certificate for authenticating to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The client key for authenticating to the Kubernetes cluster. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The CA certificate for the Kubernetes cluster. |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the AKS cluster. |
| <a name="output_grafana_endpoint"></a> [grafana\_endpoint](#output\_grafana\_endpoint) | The endpoint URL of the Azure Managed Grafana instance. |
| <a name="output_grafana_id"></a> [grafana\_id](#output\_grafana\_id) | The ID of the Azure Managed Grafana instance. |
| <a name="output_host"></a> [host](#output\_host) | The Kubernetes cluster server host. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the AKS cluster. |
| <a name="output_identity_principal_id"></a> [identity\_principal\_id](#output\_identity\_principal\_id) | The principal ID of the system assigned identity of the AKS cluster. |
| <a name="output_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#output\_key\_vault\_secrets\_provider) | The Key Vault Secrets Provider details. |
| <a name="output_kube_admin_config"></a> [kube\_admin\_config](#output\_kube\_admin\_config) | The Kubernetes admin configuration. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | The Kubernetes configuration. |
| <a name="output_kubelet_identity_client_id"></a> [kubelet\_identity\_client\_id](#output\_kubelet\_identity\_client\_id) | The client ID of the AKS kubelet identity. |
| <a name="output_kubelet_identity_object_id"></a> [kubelet\_identity\_object\_id](#output\_kubelet\_identity\_object\_id) | The object ID of the AKS kubelet identity. |
| <a name="output_name"></a> [name](#output\_name) | The name of the AKS cluster. |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | The resource group where the Kubernetes nodes are deployed. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | The OIDC issuer URL of the AKS cluster. |
| <a name="output_prometheus_workspace_id"></a> [prometheus\_workspace\_id](#output\_prometheus\_workspace\_id) | The ID of the Azure Monitor workspace for Prometheus. |
<!-- END_TF_DOCS -->
