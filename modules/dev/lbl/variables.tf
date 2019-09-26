variable "name" {}

variable "env" {}

variable "vpc" {}

variable "load_balancer_arn" {}

variable "target_group_arn" {}

variable "tags" {
  type    = "map"
  default = {}
}

