<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.75.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.75.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_inflate_enabled"></a> [auto\_inflate\_enabled](#input\_auto\_inflate\_enabled) | Whether Auto Inflate is enabled. | `bool` | `false` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis. | `number` | `1` | no |
| <a name="input_dedicated_cluster_id"></a> [dedicated\_cluster\_id](#input\_dedicated\_cluster\_id) | Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created. | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Specifies the environment the EventHub Namespace belongs to. | `string` | `"dev"` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | An identity block with type and identity IDs. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | `null` | no |
| <a name="input_local_authentication_enabled"></a> [local\_authentication\_enabled](#input\_local\_authentication\_enabled) | Whether SAS authentication is enabled for the EventHub Namespace. Default is `true`. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the EventHub Namespace resources will be created. | `string` | n/a | yes |
| <a name="input_maximum_throughput_units"></a> [maximum\_throughput\_units](#input\_maximum\_throughput\_units) | Specifies the maximum number of throughput units when Auto Inflate is enabled. Valid values range from 1 - 20. | `number` | `null` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum supported TLS version for this EventHub Namespace. Valid values are: 1.0, 1.1 and 1.2. Default is `1.2`. | `string` | `"1.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the EventHub Namespace. | `string` | n/a | yes |
| <a name="input_network_rulesets"></a> [network\_rulesets](#input\_network\_rulesets) | The network rulesets configuration. | <pre>object({<br/>    default_action                 = string<br/>    public_network_access_enabled  = optional(bool)<br/>    trusted_service_access_enabled = optional(bool)<br/>    virtual_network_rule = optional(list(object({<br/>      subnet_id                                       = string<br/>      ignore_missing_virtual_network_service_endpoint = optional(bool)<br/>    })))<br/>    ip_rule = optional(list(object({<br/>      ip_mask = string<br/>      action  = optional(string)<br/>    })))<br/>  })</pre> | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is enabled for the EventHub Namespace. Default is `true`. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the EventHub Namespace. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Specifies which SKU tier to use for the EventHub Namespace. Default is `Standard`. | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the EventHub Namespace resource. | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | The timeouts for creating, updating, reading and deleting the EventHub Namespace | <pre>object({<br/>    create = optional(string)<br/>    update = optional(string)<br/>    read   = optional(string)<br/>    delete = optional(string)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_primary_connection_string"></a> [default\_primary\_connection\_string](#output\_default\_primary\_connection\_string) | The primary connection string for the authorization rule `RootManageSharedAccessKey`. |
| <a name="output_default_primary_connection_string_alias"></a> [default\_primary\_connection\_string\_alias](#output\_default\_primary\_connection\_string\_alias) | The alias of the primary connection string for the authorization rule `RootManageSharedAccessKey`, which is generated when disaster recovery is enabled. |
| <a name="output_default_primary_key"></a> [default\_primary\_key](#output\_default\_primary\_key) | The primary access key for the authorization rule `RootManageSharedAccessKey`. |
| <a name="output_default_secondary_connection_string"></a> [default\_secondary\_connection\_string](#output\_default\_secondary\_connection\_string) | The secondary connection string for the authorization rule `RootManageSharedAccessKey`. |
| <a name="output_default_secondary_connection_string_alias"></a> [default\_secondary\_connection\_string\_alias](#output\_default\_secondary\_connection\_string\_alias) | The alias of the secondary connection string for the authorization rule `RootManageSharedAccessKey`, which is generated when disaster recovery is enabled. |
| <a name="output_default_secondary_key"></a> [default\_secondary\_key](#output\_default\_secondary\_key) | The secondary access key for the authorization rule `RootManageSharedAccessKey`. |
| <a name="output_id"></a> [id](#output\_id) | The EventHub Namespace ID. |
| <a name="output_name"></a> [name](#output\_name) | The name of the EventHub Namespace. |
<!-- END_TF_DOCS -->
