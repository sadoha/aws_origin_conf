variable "name" {}

variable "env" {}

variable "subnet_private_az0" {}

variable "subnet_private_az1" {}

variable "ec2_launch_conf" {}

variable "target_group_80_arn" {}

variable "tags" {
  type    = "map"
  default = {}
}
