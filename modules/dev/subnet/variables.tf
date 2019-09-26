variable "name" {}

variable "env" {}

variable "vpc" {}

variable "azs" {
  type    = "list"
}

variable "cidr_block" {
  type    = "list"
  description = "The list of subnet blocks" 
  default = ["10.130.1.0/24", "10.130.2.0/24", "10.130.3.0/24", "10.130.4.0/24"]
}

variable "tags" {
  type    = "map"
  default = {}
}
