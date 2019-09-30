variable "name" {}

variable "env" {}

variable "subnet_private_az0" {}

variable "subnet_private_az1" {}

variable "security_groups" {}

variable "engine_type" {
  description = "The type of broker engine"
  default = "ActiveMQ"
}

variable "engine_version" {
  description = "The version of the broker engine"
  default = "5.15.0"
}

variable "host_instance_type" {
  description = "The broker's instance type. e.g. mq.t2.micro or mq.m4.large"
  default = "mq.t2.micro"
}

variable "username" {
  description = "The username of the user"
  default = "operator"
}

variable "tags" {
  type    = "map"
  default = {}
}
