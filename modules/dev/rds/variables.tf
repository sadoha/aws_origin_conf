variable "name" {}

variable "env" {}

variable "azs" {}

variable "vpc" {}

variable "kms_key" {}

variable "security_groups" {}

variable "subnet_private_az0" {}

variable "subnet_private_az1" {}

variable "instance" {
  description = "Type of VMs in rds cluster"
  default = "db.m4.large"
}

variable "storage_type" {
  description = "Type of rds storage"
  default = "standard"
}

variable "storage" {
  description = "The storage of rds database"
  default = "8"
}

variable "port" {
  description = "The RDS port"
  default = "5432"
}

variable "engine" {
  description = "The RDS engine"
  default = "postgres"
}

variable "engine_version" {
  description = "The RDS engine version"
  default = "10.5"
}

variable "backup_retention_period" {
  description = "The backup retention period of RDS db"
  default = "7"
}

variable "tags" {
  type    = "map"
  default = {}
}
