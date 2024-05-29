variable "environment" {}

variable "subnet_id" {}
variable "ami_id" {
  type    = string
}

variable "instance_name" {
  type    = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "volume_type" {
  type =  string
  default = "gp3"
}

variable "volume_size" {
  type =  number
  default = 10
}

variable "key_name" {}

variable "vpc_security_group_ids" {}
variable "tags" {
  type        = map(string)
  default     = {}
}

variable "key_name" {
  type = string
}

variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
    cidr_blocks = list(string)
  }))
}




Навести приклад приклад використання модулю, де бекендом виступає S3:


На рахунок цього не зовсім зрозумів задачу, поки шо я стикався шоб S3 використовувався як backend то тільки для сторінга тераформ стейтів в S3 через DynamoDB а також для використовування дати в модулях, наприклад:


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = var.region
    bucket = var.tfstate_bucket
    key    = var.vpc_tfstate_key
  }
}


terraform_remote_state_vpc = data.terraform_remote_state.vpc.outputs
vpc_id                     = local.terraform_remote_state_vpc.vpc_id
vpc_cidr                   = local.terraform_remote_state_vpc.vpc_cidr_block
public_subnets             = local.terraform_remote_state_vpc.public_subnets
private_subnets            = local.terraform_remote_state_vpc.private_subnets
database_subnets           = local.terraform_remote_state_vpc.database_subnets