variable "name" {}

variable "env" {}

variable "amis" {}

variable "region" {}

variable "key_name" {}

variable "security_group" {}

variable "tags" {
  type    = "map"
  default = {}
}
