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
| [azurerm_log_analytics_solution.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | Whether to enable Container Insights. Default is `true`. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment where the Log Analytics workspace will be created. | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Log Analytics workspace will be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Log Analytics workspace. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the Log Analytics workspace will be created. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain logs. Default is `30`. | `number` | `30` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Log Analytics workspace. Default is `PerGB2018`. | `string` | `"PerGB2018"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The mapping of tags to apply to the Log Analytics workspace. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Log Analytics workspace. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Log Analytics workspace. |
| <a name="output_primary_shared_key"></a> [primary\_shared\_key](#output\_primary\_shared\_key) | The primary shared key of the Log Analytics workspace. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The workspace ID of the Log Analytics workspace. |
<!-- END_TF_DOCS -->
