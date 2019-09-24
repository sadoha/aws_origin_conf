resource "aws_vpc" "vpci_1" {
  cidr_block           = "172.16.1.0/24"
  enable_dns_hostnames = true
}

