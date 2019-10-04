variable "name" {}

variable "env" {}

variable "vpc" {}

variable "azs" {
  type    = "list"
}

variable "cidr_block_public" {
  type    = "list"
  description = "The list of public subnet blocks"
  default = [
		"172.16.0.0/27",          
		"172.16.0.32/27",         
		"172.16.0.64/27",         
		"172.16.0.96/27",         
		"172.16.0.128/27",        
		"172.16.0.160/27",        
		"172.16.0.192/27",        
		"172.16.0.224/27"
            ]
}

variable "cidr_block_private_az0" {
  type    = "list"
  description = "The list of private az0 subnet blocks"
  default = [
                "172.16.10.0/28",
                "172.16.10.16/28",
                "172.16.10.32/28",
                "172.16.10.48/28",
                "172.16.10.64/28",
                "172.16.10.80/28",
                "172.16.10.96/28",
                "172.16.10.112/28",
                "172.16.10.128/28",
                "172.16.10.144/28",
                "172.16.10.160/28",
                "172.16.10.176/28",
                "172.16.10.192/28",
                "172.16.10.208/28",
                "172.16.10.224/28",
                "172.16.10.240/28"
            ]
}

variable "cidr_block_private_az1" {
  type    = "list"
  description = "The list of private az1 subnet blocks"
  default = [
                "172.16.11.0/28",
                "172.16.11.16/28",
                "172.16.11.32/28",
                "172.16.11.48/28",
                "172.16.11.64/28",
                "172.16.11.80/28",
                "172.16.11.96/28",
                "172.16.11.112/28",
                "172.16.11.128/28",
                "172.16.11.144/28",
                "172.16.11.160/28",
                "172.16.11.176/28",
                "172.16.11.192/28",
                "172.16.11.208/28",
                "172.16.11.224/28",
                "172.16.11.240/28"
            ]
}

variable "cidr_block_private_elc" {
  type    = "list"
  description = "The list of public ElastiCache subnet blocks"
  default = [
                "172.16.20.0/27",
                "172.16.20.32/27",
                "172.16.20.64/27",
                "172.16.20.96/27",
                "172.16.20.128/27",
                "172.16.20.160/27",
                "172.16.20.192/27",
                "172.16.20.224/27"
            ]
}

variable "cidr_block_private_mq" {
  type    = "list"
  description = "The list of public Amazon MQ subnet blocks"
  default = [
                "172.16.30.0/27",
                "172.16.30.32/27",
                "172.16.30.64/27",
                "172.16.30.96/27",
                "172.16.30.128/27",
                "172.16.30.160/27",
                "172.16.30.192/27",
                "172.16.30.224/27"
            ]
}

variable "cidr_block_private_rds" {
  type    = "list"
  description = "The list of public RDS subnet blocks"
  default = [
                "172.16.40.0/27",
                "172.16.40.32/27",
                "172.16.40.64/27",
                "172.16.40.96/27",
                "172.16.40.128/27",
                "172.16.40.160/27",
                "172.16.40.192/27",
                "172.16.40.224/27"
            ]
}

variable "tags" {
  type    = "map"
  default = {}
}
