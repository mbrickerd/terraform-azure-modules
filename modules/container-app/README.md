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
| [azurerm_container_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_app_environment_id"></a> [container\_app\_environment\_id](#input\_container\_app\_environment\_id) | The ID of the Container Apps Environment where this Container App should be created. | `string` | n/a | yes |
| <a name="input_dapr"></a> [dapr](#input\_dapr) | The Dapr configuration for the Container App. | <pre>object({<br/>    app_id       = string<br/>    app_port     = number<br/>    app_protocol = optional(string, "http")<br/>  })</pre> | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Specifies the environment the Container App belongs to. | `string` | `"dev"` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | The managed identity configuration for the Container App. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | `null` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | The ingress configuration for the Container App. | <pre>object({<br/>    external_enabled = optional(bool, false)<br/>    target_port      = optional(number)<br/>    transport        = optional(string, "auto")<br/>    traffic_weight = optional(list(object({<br/>      percentage      = number<br/>      latest_revision = optional(bool, true)<br/>      revision_suffix = optional(string)<br/>    })), [])<br/>    allow_insecure_connections = optional(bool, false)<br/>    ip_restriction = optional(list(object({<br/>      name             = string<br/>      ip_address_range = string<br/>      action           = string<br/>      priority         = number<br/>    })), [])<br/>    custom_domain = optional(list(object({<br/>      name                 = string<br/>      certificate_name     = string<br/>      certificate_password = optional(string)<br/>      dns_zone_id          = optional(string)<br/>      hostname             = string<br/>    })), [])<br/>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Container App. | `string` | n/a | yes |
| <a name="input_registry"></a> [registry](#input\_registry) | The container registry configuration. | <pre>list(object({<br/>    server               = string<br/>    identity             = optional(string)<br/>    username             = optional(string)<br/>    password_secret_name = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Container App. | `string` | n/a | yes |
| <a name="input_revision_mode"></a> [revision\_mode](#input\_revision\_mode) | The revision mode of the Container App. Possible values are `Single` and `Multiple`. | `string` | `"Single"` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | The secrets configuration for the Container App. | <pre>list(object({<br/>    name  = string<br/>    value = string<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_template"></a> [template](#input\_template) | The template for the Container App. | <pre>object({<br/>    containers = list(object({<br/>      name         = string<br/>      image        = string<br/>      cpu          = number<br/>      memory       = string<br/>      min_replicas = optional(number, 1)<br/>      max_replicas = optional(number, 1)<br/>      env = optional(list(object({<br/>        name  = string<br/>        value = string<br/>      })), [])<br/>      env_secret = optional(list(object({<br/>        name        = string<br/>        secret_name = string<br/>      })), [])<br/>      args    = optional(list(string), [])<br/>      command = optional(list(string), [])<br/>      probes = optional(list(object({<br/>        type             = string<br/>        http_get_path    = optional(string)<br/>        initial_delay    = optional(number)<br/>        interval_seconds = optional(number)<br/>        timeout          = optional(number)<br/>        failure_count    = optional(number)<br/>        success_count    = optional(number)<br/>      })), [])<br/>    }))<br/>    scale = optional(object({<br/>      min_replicas = optional(number, 1)<br/>      max_replicas = optional(number, 1)<br/>      rules = optional(list(object({<br/>        name = string<br/>        http_scale_rule = optional(object({<br/>          concurrent_requests = string<br/>        }))<br/>        custom_scale_rule = optional(object({<br/>          authentication = list(object({<br/>            secret_name       = string<br/>            trigger_parameter = string<br/>          }))<br/>          metadata = map(string)<br/>          type     = string<br/>        }))<br/>      })), [])<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_workload_profile_name"></a> [workload\_profile\_name](#input\_workload\_profile\_name) | The name of the workload profile to use for the Container App. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Container App. |
| <a name="output_latest_revision_fqdn"></a> [latest\_revision\_fqdn](#output\_latest\_revision\_fqdn) | The FQDN of the latest revision of the Container App. |
| <a name="output_latest_revision_name"></a> [latest\_revision\_name](#output\_latest\_revision\_name) | The name of the latest revision of the Container App. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Container App. |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | The outbound IP addresses of the Container App. |
<!-- END_TF_DOCS -->
