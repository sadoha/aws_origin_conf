variable "name" {
  default = "example.com"
  description = "The name of project"
}

variable "env" {
  description = "Environment name"
  default = "dev"
}

variable "region" {
  description = "Region that the instances will be created"
  default = "us-east-1"
}

variable "azs" {
  type    = "list"
  description = "The list of availability zones"
  default = ["us-east-1a", "us-east-1b"]
}

variable "amis" {
  description = "CentOS Linux 7 x86_64 HVM EBS ENA"
  default = {
  	us-east-1 = "ami-02eac2c0129f6376b"
  }
}

