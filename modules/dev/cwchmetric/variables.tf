variable "name" {}

variable "env" {}

variable "asg_group_name" {}

variable "alarm_actions_heavy_in" {}

variable "alarm_actions_heavy_out" {}

variable "tags" {
  type    = "map"
  default = {}
}
