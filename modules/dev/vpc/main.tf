resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags                 = "${merge(map("Name", "vpc-${var.name}-${var.env}"), var.tags)}"
}
