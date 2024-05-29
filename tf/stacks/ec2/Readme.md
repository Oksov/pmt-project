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
