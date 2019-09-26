variable "name" {}

variable "env" {}

variable "vpc" {}

variable "azs" {}

variable "subnet_public_az0" {}

variable "subnet_public_az1" {}

variable "gateway" {}

variable "nat_gateway_az0" {}

variable "nat_gateway_az1" {}

variable "tags" {
  type    = "map"
  default = {}
}

