variable "name" {}

variable "env" {}

variable "s3_key_policy" {
  description = "The policy of the key usage"
  type        = "string"
  default     = ""
}

variable "rds_key_policy" {
  description = "The policy of the key usage"
  type        = "string"
  default     = ""
}

variable "tags" {
  type    = "map"
  default = {}
} 

