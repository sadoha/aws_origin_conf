resource "aws_subnet" "subnet_public_az0" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_public[0]}"
  availability_zone             = "${var.azs[0]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-public-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_public_az1" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_public[1]}"
  availability_zone             = "${var.azs[1]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-public-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_ec2_az0" {
  vpc_id 			= "${var.vpc}"
  cidr_block 			= "${var.cidr_block_private_az0[0]}"
  availability_zone 		= "${var.azs[0]}"
  map_public_ip_on_launch 	= "true"

  tags   = "${merge(map("Name", "subnet-private-ec2-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_ec2_az1" {
  vpc_id 			= "${var.vpc}"
  cidr_block 			= "${var.cidr_block_private_az1[0]}"
  availability_zone 		= "${var.azs[1]}"
  map_public_ip_on_launch 	= "true"

  tags   = "${merge(map("Name", "subnet-private-ec2-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_asg_az0" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_az0[8]}"
  availability_zone             = "${var.azs[0]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-asg-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_asg_az1" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_az1[8]}"
  availability_zone             = "${var.azs[1]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-asg-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_elc_az0" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_elc[0]}"
  availability_zone             = "${var.azs[0]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-elc-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_elc_az1" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_elc[1]}"
  availability_zone             = "${var.azs[1]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-elc-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_mq_az0" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_mq[0]}"
  availability_zone             = "${var.azs[0]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-mq-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_mq_az1" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_mq[1]}"
  availability_zone             = "${var.azs[1]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-mq-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_rds_az0" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_rds[0]}"
  availability_zone             = "${var.azs[0]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-rds-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_subnet" "subnet_private_rds_az1" {
  vpc_id                        = "${var.vpc}"
  cidr_block                    = "${var.cidr_block_private_rds[1]}"
  availability_zone             = "${var.azs[1]}"
  map_public_ip_on_launch       = "true"

  tags   = "${merge(map("Name", "subnet-private-rds-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}
