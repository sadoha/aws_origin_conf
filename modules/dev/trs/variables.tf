variable "region" {}

variable "bucket" {
  default = "testtfstatefiles"
  description = "The name of S3 storage for tfstate files"
}

variable "key" {
  default = "terraform.tfstate"
  description = "The name of tfstate file"
}

