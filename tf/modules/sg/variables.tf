variable "ami_id" {
  type    = string
  default = data.aws_ami.ubuntu.id
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

variable "tags" {
  type        = map(string)
  default     = {}
}