variable "name" {}

variable "env" {}

variable "asg_group_name" {}

variable "tags" {
  type    = "map"
  default = {}
}
