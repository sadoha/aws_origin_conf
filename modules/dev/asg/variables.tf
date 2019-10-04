variable "name" {}

variable "env" {}

variable "subnet_private_az0" {}

variable "subnet_private_az1" {}

variable "launch_template_id" {}

variable "launch_template_version" {}

variable "target_group_80_arn" {}

variable "tags" {
  type    = "map"
  default = {}
}
