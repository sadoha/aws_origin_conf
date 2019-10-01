variable "name" {}

variable "env" {}

variable "vpc" {}

variable "azs" {}

variable "subnet_private_az0" {}

variable "subnet_private_az1" {}

variable "security_group" {}

variable "memcached_engine_version" {
  description = "The memcached engine version"
  default = "1.5.16"
}

variable "memcached_node_type" {
  description = "The memcached node type"
  default = "cache.t2.small"
}

variable "memcached_port" {
  description = "The port of memcached"
  default = "11211"
}

variable "redis_engine_version" {
  description = "The redis engine version"
  default = "5.0.5"
}

variable "redis_node_type" {
  description = "The redis node type"
  default = "cache.t2.small"
}

variable "redis_port" {
  description = "The port of redis"
  default = "6379"
}

variable "tags" {
  type    = "map"
  default = {}
}

