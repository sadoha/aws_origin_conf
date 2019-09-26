variable "name" {}

variable "env" {}

variable "vpc" {}

variable "security_groups" {}

variable "subnet_public_az0" {}

variable "subnet_public_az1" {}

variable "tags" {
  type    = "map"
  default = {}
}

