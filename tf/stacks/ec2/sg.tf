module "security_group" {
  source      = "../modules/sg"
  name        = "example-sg"
  description = "Security Group for example"
  vpc_id      = "vpc-0abcd1234abcd1234" # Replace with your VPC ID

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

  tags = locals.tags
}

output "security_group_id" {
  value = module.security_group.security_group_id
}