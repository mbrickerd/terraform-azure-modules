variable "key_vault_id" {
  description = "The ID of the Key Vault where secret will be stored."
  type        = string
}

variable "secrets" {
  description = "The list of secrets to store in the Key Vault."
  type = list(object({
    name            = string
    content         = string
    content_type    = optional(string)
    expiration_date = optional(string)
    tags            = optional(map(string))
  }))

  sensitive = true

  validation {
    condition = alltrue([
      for s in var.secrets :
      can(regex("^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z$", s.expiration_date))
      if try(s.expiration_date, null) != null
    ])
    error_message = "Expiration date must be in RFC3339 format (`YYYY-MM-DDTHH:MM:SSZ`)."
  }
}

variable "default_expiration_days" {
  description = "The default number of days until secret expiration (overridden by secret-specific expiration_date). Defaults to 365 (1 year)."
  type        = number
  default     = 365
}
