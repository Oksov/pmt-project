resource "tls_private_key" "maintainer" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.maintainer.public_key_openssh
  tags = var.tags
}