module "ec2" {
  source         = "../../modules/ec2"
  instance_name = "${var.environment}-simple-ec2-instance"
  instance_type = "t3.micro"
  count         = 1
  ami_id = null
  subnet_id = var.subnet_id
  vpc_security_group_ids = [module.security_group.security_group_id]
  key_name      = module.rsa.generated_key_name
  volume_size = 11
  volume_type = "gp2"
  tags = local.tags
  environment = var.environment

  depends_on = [ module.rsa, module.security_group ]
}
