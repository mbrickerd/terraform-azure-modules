locals {
  secret_metadata = {
    for idx, secret in var.secrets : tostring(idx) => {
      name         = secret.name
      content_type = try(secret.content_type, null)
      expiration_date = try(
        secret.expiration_date,
        formatdate("YYYY-MM-DD'T'hh:mm:ss'Z'", timeadd(timestamp(), "${var.default_expiration_days * 24}h"))
      )
      tags = try(secret.tags, null)
    }
  }

  secret_content = {
    for idx, secret in var.secrets : tostring(idx) => secret.content
  }
}
