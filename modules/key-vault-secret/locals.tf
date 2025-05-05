locals {
  secrets = {
    for name, secret in var.secrets : name => merge(secret, {
      expiration_date = try(
        secret.expiration_date,
        formatdate("YYYY-MM-DD'T'hh:mm:ss'Z'", timeadd(timestamp(), "${var.default_expiration_days * 24}h"))
      )
    })
  }
}
