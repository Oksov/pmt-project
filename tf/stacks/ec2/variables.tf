variable "subnet_id" {}
variable "environment" {
  type = string
  default = "dev"
}

variable "project" {
  type = string
  default = "paymentop"
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

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

