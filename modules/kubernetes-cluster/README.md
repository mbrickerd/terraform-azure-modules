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
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_group_object_ids"></a> [admin\_group\_object\_ids](#input\_admin\_group\_object\_ids) | A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster | `list(string)` | `[]` | no |
| <a name="input_azure_rbac_enabled"></a> [azure\_rbac\_enabled](#input\_azure\_rbac\_enabled) | Is Role Based Access Control based on Azure AD enabled? | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_default_node_pool"></a> [default\_node\_pool](#input\_default\_node\_pool) | Default node pool configuration | <pre>object({<br/>    name                = string<br/>    vm_size             = string<br/>    node_count          = number<br/>    enable_auto_scaling = optional(bool, false)<br/>    min_count           = optional(number, null)<br/>    max_count           = optional(number, null)<br/>    vnet_subnet_id      = optional(string, null)<br/>    zones               = optional(list(string), null)<br/>    os_disk_size_gb     = optional(number, 128)<br/>    os_disk_type        = optional(string, "Managed")<br/>    tags                = optional(map(string), {})<br/>  })</pre> | <pre>{<br/>  "enable_auto_scaling": true,<br/>  "max_count": 3,<br/>  "min_count": 1,<br/>  "name": "default",<br/>  "node_count": 1,<br/>  "os_disk_size_gb": 128,<br/>  "os_disk_type": "Managed",<br/>  "tags": {},<br/>  "vm_size": "Standard_D2s_v3"<br/>}</pre> | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix specified when creating the managed cluster | `string` | `null` | no |
| <a name="input_enable_key_vault_secrets_provider"></a> [enable\_key\_vault\_secrets\_provider](#input\_enable\_key\_vault\_secrets\_provider) | Enable the Key Vault secrets provider for the AKS cluster | `bool` | `false` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Version of Kubernetes specified when creating the AKS cluster | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Resource Group should exist | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics Workspace which the OMS Agent should send data to | `string` | `null` | no |
| <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile) | Network profile configuration | <pre>object({<br/>    network_plugin     = string<br/>    network_policy     = optional(string, null)<br/>    load_balancer_sku  = optional(string, "standard")<br/>    docker_bridge_cidr = optional(string, null)<br/>    service_cidr       = optional(string, null)<br/>    dns_service_ip     = optional(string, null)<br/>    outbound_type      = optional(string, "loadBalancer")<br/>  })</pre> | <pre>{<br/>  "load_balancer_sku": "standard",<br/>  "network_plugin": "kubenet",<br/>  "outbound_type": "loadBalancer"<br/>}</pre> | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Additional node pools configuration | <pre>map(object({<br/>    vm_size             = string<br/>    node_count          = number<br/>    enable_auto_scaling = optional(bool, false)<br/>    min_count           = optional(number, null)<br/>    max_count           = optional(number, null)<br/>    vnet_subnet_id      = optional(string, null)<br/>    zones               = optional(list(string), null)<br/>    os_disk_size_gb     = optional(number, 128)<br/>    os_disk_type        = optional(string, "Managed")<br/>    os_type             = optional(string, "Linux")<br/>    priority            = optional(string, "Regular")<br/>    mode                = optional(string, "User")<br/>    node_labels         = optional(map(string), {})<br/>    node_taints         = optional(list(string), [])<br/>    max_pods            = optional(number, 30)<br/>    tags                = optional(map(string), {})<br/>  }))</pre> | `{}` | no |
| <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group) | The name of the Resource Group where the Kubernetes nodes should exist | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Kubernetes cluster should exist | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster | `string` | `"Free"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Kubernetes Managed Cluster ID |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity block of the AKS cluster |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | A kube\_config block as documented |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | Raw Kubernetes config for the admin user |
| <a name="output_kubelet_identity"></a> [kubelet\_identity](#output\_kubelet\_identity) | The Kubelet identity block |
| <a name="output_name"></a> [name](#output\_name) | The Kubernetes Managed Cluster name |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | The auto-generated Resource Group which contains the Kubernetes resources |
<!-- END_TF_DOCS -->
