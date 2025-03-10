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
| [azurerm_network_watcher_flow_log.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether Network Flow Logging should be enabled. | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Specifies the environment the Network Watcher Flow Log belongs to. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the Network Watcher Flow Log exists. | `string` | `"westeurope"` | no |
| <a name="input_name"></a> [name](#input\_name) | The base name that will be used in the Network Watcher Flow Log naming convention. | `string` | n/a | yes |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | The name of the Network Watcher. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix name that will be used in the Network Watcher Flow Log naming convention. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Network Watcher Flow Log should be created. | `string` | n/a | yes |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Retention policy for flow logs | <pre>object({<br/>    enabled = bool<br/>    days    = number<br/>  })</pre> | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the Storage Account where flow logs are stored. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the Network Watcher Flow Log. | `map(string)` | `{}` | no |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | The ID of the Resource for which to enable flow logs for. | `string` | n/a | yes |
| <a name="input_traffic_analytics"></a> [traffic\_analytics](#input\_traffic\_analytics) | Configuration for traffic analytics. | <pre>object({<br/>    enabled               = bool<br/>    workspace_id          = string<br/>    workspace_region      = string<br/>    workspace_resource_id = string<br/>    interval_in_minutes   = optional(number, 60)<br/>  })</pre> | `null` | no |
| <a name="input_version"></a> [version](#input\_version) | The version (revision) of the flow log. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Network Watcher. |
