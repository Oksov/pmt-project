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