variable "name" {}

variable "env" {}

variable "vpc" {}

variable "azs" {}

variable "subnet_public_az0" {}

variable "subnet_public_az1" {}

variable "subnet_private_ec2_az0" {}

variable "subnet_private_ec2_az1" {}

variable "subnet_private_asg_az0" {}

variable "subnet_private_asg_az1" {}

variable "subnet_private_elc_az0" {}

variable "subnet_private_elc_az1" {}

variable "subnet_private_mq_az0" {}

variable "subnet_private_mq_az1" {}

variable "subnet_private_rds_az0" {}

variable "subnet_private_rds_az1" {}

variable "gateway" {}

variable "nat_gateway_az0" {}

variable "nat_gateway_az1" {}

variable "tags" {
  type    = "map"
  default = {}
}

