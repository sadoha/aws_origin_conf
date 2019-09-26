resource "aws_subnet" "subnet_public_az0" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block[0]}"
  availability_zone             = "${var.azs[0]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-public-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_public_az1" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block[1]}"
  availability_zone             = "${var.azs[1]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-public-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_az0" {
  vpc_id 			= "${var.vpc}"
  cidr_block 			= "${var.cidr_block[2]}"
  availability_zone 		= "${var.azs[0]}"
  map_public_ip_on_launch 	= true

  tags   = "${merge(map("Name", "subnet-private-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_az1" {
  vpc_id 			= "${var.vpc}"
  cidr_block 			= "${var.cidr_block[3]}"
  availability_zone 		= "${var.azs[1]}"
  map_public_ip_on_launch 	= true

  tags   = "${merge(map("Name", "subnet-private-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}
