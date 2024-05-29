resource "aws_launch_template" "nodejs_ec2_template" {
  name_prefix   = "nodejs-ec2-template-"
  image_id      = var.ami_id == null ? data.aws_ami.ubuntu.id : var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  block_device_mappings {

    device_name = "/dev/xvda"
    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "${var.environment}-tempate"
      Service = "ec2"
    }
  }
}

resource "aws_instance" "nodejs_ec2" {
  count          = var.instance_count
  instance_type  = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  launch_template {
    id = aws_launch_template.nodejs_ec2_template.id
    version = aws_launch_template.nodejs_ec2_template.latest_version
  }

  tags = merge({ Service = "ec2", Name = "${var.environment}-nodejs-ec2-instance" }, var.tags)
}