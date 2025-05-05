variable "key_vault_id" {
  description = "The ID of the Key Vault where the secret will be stored."
  type        = string
}

variable "name" {
  description = "The name of the secret."
  type        = string
}

variable "content" {
  description = "The value of the secret."
  type        = string
  sensitive   = true
}

variable "content_type" {
  description = "The content type of the secret."
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "The expiration date of the secretin RFC3339 format."
  type        = string
  default     = null

  validation {
    condition     = var.expiration_date == null || can(regex("^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$", var.expiration_date))
    error_message = "The expiration date must be in RFC3339 format (`YYYY-MM-DDTHH:MM:SSZ`)."
  }
}

variable "tags" {
  description = "A mapping of tags to add to all resources."
  type        = map(string)
  default     = {}
}
