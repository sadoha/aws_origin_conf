variable "name" {}

variable "env" {}

variable "vpc" {}

variable "security_groups" {}

variable "subnet_private_az0" {}

variable "subnet_private_az1" {}

variable "tags" {
  type    = "map"
  default = {}
}

