variable "name" {}

variable "env" {}

variable "amis" {}

variable "region" {}

variable "key_name" {}

variable "security_group" {}

variable "instance_type" {
  description = "The type of ec2 instance"
  default = "t2.micro"
}

variable "volume_type" {
  description = "The type of volume"
  default = "standard"
}

variable "volume_size" {
  description = "The size of volume"
  default = "8"
}

variable "iops" {
  description = "The count of iops"
  default = "0"
}

variable "tags" {
  type    = "map"
  default = {}
}
