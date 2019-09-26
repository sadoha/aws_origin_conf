variable "name" {}

variable "env" {}

variable "subnet_private_az0" {}

variable "subnet_private_az1" {}

variable "ec2_launch_conf" {}

variable "elb" {}

variable "tags" {
  type    = "map"
  default = {}
}
