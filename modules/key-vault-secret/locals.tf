locals {
  # Convert sensitive map to list to avoid key sensitivity
  secrets_list = [for secret in var.secrets : secret]

  # Create non-sensitive lookup maps
  secret_lookup = {
    for secret in local.secrets_list : secret.name => {
      content_type = try(secret.content_type, null)
      expiration_date = try(
        secret.expiration_date,
        formatdate("YYYY-MM-DD'T'hh:mm:ss'Z'", timeadd(timestamp(), "${var.default_expiration_days * 24}h"))
      )
    }
  }

  content_lookup = {
    for secret in local.secrets_list : secret.name => secret.content
  }
}
