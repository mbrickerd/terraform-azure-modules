<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled) | Enable admin user for the Container Registry. | `bool` | `false` | no |
| <a name="input_data_endpoint_enabled"></a> [data\_endpoint\_enabled](#input\_data\_endpoint\_enabled) | Whether to enable dedicated data endpoints for the Container Registry. | `bool` | `true` | no |
| <a name="input_encryption"></a> [encryption](#input\_encryption) | The encryption configuration for the Container Registry. | <pre>object({<br/>    enabled            = optional(bool, false)<br/>    identity_client_id = optional(string)<br/>    key_vault_key_id   = optional(string)<br/>  })</pre> | <pre>{<br/>  "enabled": false<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Specifies the environment the Container Registry belongs to. | `string` | `"dev"` | no |
| <a name="input_georeplications"></a> [georeplications](#input\_georeplications) | A list of Azure locations where the Container Registry should be geo-replicated. | <pre>list(object({<br/>    location                = string<br/>    zone_redundancy_enabled = optional(bool, true)<br/>    tags                    = optional(map(string), {})<br/>  }))</pre> | <pre>[<br/>  {<br/>    "location": "westeurope",<br/>    "tags": {},<br/>    "zone_redundancy_enabled": true<br/>  }<br/>]</pre> | no |
| <a name="input_identity"></a> [identity](#input\_identity) | The managed identity configuration for the Container Registry. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Container Registry will be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Container Registry. | `string` | n/a | yes |
| <a name="input_network_rule_set"></a> [network\_rule\_set](#input\_network\_rule\_set) | The network rule set for the Container Registry. | <pre>object({<br/>    default_action = optional(string, "Deny")<br/>    ip_rules = optional(list(object({<br/>      action   = string<br/>      ip_range = string<br/>    })), [])<br/>    virtual_network_rules = optional(list(object({<br/>      action    = string<br/>      subnet_id = string<br/>    })), [])<br/>  })</pre> | <pre>{<br/>  "default_action": "Deny",<br/>  "ip_rules": [],<br/>  "virtual_network_rules": []<br/>}</pre> | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for the Container Registry. Defaults to `false` for security. | `bool` | `false` | no |
| <a name="input_quarantine_policy_enabled"></a> [quarantine\_policy\_enabled](#input\_quarantine\_policy\_enabled) | Enable quarantine policy for the Container Registry. Defaults to `true` for security. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Container Registry. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU name of the Container Registry. Possible values are `Basic`, `Standard`, `Premium`, `Classic`. | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#input\_zone\_redundancy\_enabled) | Whether to enable zone redundancy for the Container Registry. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The Password associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The Username associated with the Container Registry Admin account - if the admin account is enabled. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Container Registry. |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity of the Container Registry. |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The URL that can be used to log into the Container Registry. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Container Registry. |
<!-- END_TF_DOCS -->
