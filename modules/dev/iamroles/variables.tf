variable "name" {}

variable "env" {}

variable "s3_bucket" {}

variable "tags" {
  type    = "map"
  default = {}
}
