locals {
  metadata = {
    for name, secret in var.secrets : name => {
      content_type = try(secret.content_type, null)
      expiration_date = try(
        secret.expiration_date,
        formatdate("YYYY-MM-DD'T'hh:mm:ss'Z'", timeadd(timestamp(), "${var.default_expiration_days * 24}h"))
      )
      tags = try(secret.tags, null)
    }
  }

  secret_content = {
    for name, secret in var.secrets : name => secret.content
  }
}
