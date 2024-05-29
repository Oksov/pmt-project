module "security_group" {
  source      = "../../modules/sg"
  name        = "${var.environment}-sg"
  description = "Security Group for ${var.environment} environment"
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH from 0.0.0.0/0"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = local.tags
}