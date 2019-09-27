variable "name" {}

variable "env" {}

variable "read_capacity" {
  description = "The read capacity of dynamodb tables"
  default = "5"
}

variable "write_capacity" {
  description = "The write capacity of dynamodb tables"
  default = "5"
}

variable "tags" {
  type    = "map"
  default = {}
}
