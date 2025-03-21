variable "subscription_id" {
  description = "The subscription ID to grant the app registration service principal access to."
  type        = string
}

variable "display_name" {
  description = "The App Registration name displayed in the Azure Portal."
  type        = string
}

variable "role_definition_name" {
  description = "The role to assign the App Registration over the subscription."
  type        = string
}
