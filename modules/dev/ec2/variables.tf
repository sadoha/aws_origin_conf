variable "name" {}

variable "env" {}

variable "azs" {}

variable "amis" {}

variable "region" {}

variable "s3_bucket" {}

variable "key_name" {}

variable "iam_instance_profile" {}

variable "security_group" {}

variable "subnet_public_az1" {}

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

