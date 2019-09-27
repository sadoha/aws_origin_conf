variable "name" {}

variable "env" {}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  default = "172.16.0.0/16"
}

variable "tags" {
  type    = "map"
  default = {}
}
