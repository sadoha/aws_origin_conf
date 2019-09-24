variable "name" {
  default = "example.com"
  description = "The name of project"
}

variable "region" {
  description = "Region that the instances will be created"
  default = "us-east-1"
}

variable "env" {
  description = "Environment name"
  default = "dev"
}
