locals {
  tags = {
    Project     = var.project
    Environment = var.environment
    Service = "ec2"
  }
}