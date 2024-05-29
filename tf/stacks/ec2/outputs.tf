output "security_group_id" {
  value = module.security_group.security_group_id
}

output "security_group_name" {
  value = module.security_group.security_group_id
}

output "private_key" {
  value     = module.rsa.private_key
  sensitive = true
}