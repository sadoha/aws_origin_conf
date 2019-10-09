variable "name" {}

variable "env" {}

variable "lb_zone_id" {}

variable "lb_name" {}

variable "domain_name" {
  description = "The name of current domain"
  default = "sa-doha.com"
}

variable "ttl" {
  description = "The global variable for time to live"
  default = "3600"
}

variable "tags" {
  type    = "map"
  default = {}
}
