variable "name" {}

variable "env" {}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  default = "10.130.0.0/16"
}

variable "tags" {
  type    = "map"
  default = {}
}
