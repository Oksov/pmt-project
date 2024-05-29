resource "aws_instance" "nodejs_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count
  key_name      = module.rsa.key_name
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = merge({Service = "ec2"}, var.tags)

  depends_on = [ module.rsa ]
}