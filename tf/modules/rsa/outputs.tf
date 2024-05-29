output "generated_key_name" {
    value = var.key_name
}

output "private_key" {
  value     = tls_private_key.maintainer.private_key_pem
  sensitive = true
}