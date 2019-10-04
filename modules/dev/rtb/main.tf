// Public
resource "aws_route_table" "rtb_public" {
  vpc_id 	= "${var.vpc}"
  tags          = "${merge(map("Name", "rtb-public-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id                = "${aws_route_table.rtb_public.id}"
  destination_cidr_block        = "0.0.0.0/0"
  gateway_id                    = "${var.gateway}"
}

resource "aws_route_table_association" "public_az0" {
  subnet_id      = "${var.subnet_public_az0}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}

resource "aws_route_table_association" "public_az1" {
  subnet_id      = "${var.subnet_public_az1}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}

// Private
resource "aws_route_table" "rtb_private_az0" {
  vpc_id 	= "${var.vpc}"
  tags          = "${merge(map("Name", "rtb-private-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_route_table" "rtb_private_az1" {
  vpc_id 	= "${var.vpc}"
  tags          = "${merge(map("Name", "rtb-private-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_route" "private_nat_gateway_az0" {
  route_table_id         = "${aws_route_table.rtb_private_az0.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway_az0}"
}

resource "aws_route" "private_nat_gateway_az1" {
  route_table_id         = "${aws_route_table.rtb_private_az1.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${var.nat_gateway_az1}"
}


// Instances
resource "aws_route_table_association" "private_subnet_ec2_az0" {
  subnet_id       = "${var.subnet_private_ec2_az0}"
  route_table_id  = "${aws_route_table.rtb_private_az0.id}"
}

resource "aws_route_table_association" "private_subnet_ec2_az1" {
  subnet_id       = "${var.subnet_private_ec2_az1}"
  route_table_id  = "${aws_route_table.rtb_private_az1.id}"
}

// AutoScaling Group
resource "aws_route_table_association" "private_subnet_asg_az0" {
  subnet_id       = "${var.subnet_private_asg_az0}"
  route_table_id  = "${aws_route_table.rtb_private_az0.id}"
}

resource "aws_route_table_association" "private_subnet_asg_az1" {
  subnet_id       = "${var.subnet_private_asg_az1}"
  route_table_id  = "${aws_route_table.rtb_private_az1.id}"
}

// ElastiCache
resource "aws_route_table_association" "private_subnet_elc_az0" {
  subnet_id       = "${var.subnet_private_elc_az0}"
  route_table_id  = "${aws_route_table.rtb_private_az0.id}"
}

resource "aws_route_table_association" "private_subnet_elc_az1" {
  subnet_id       = "${var.subnet_private_elc_az1}"
  route_table_id  = "${aws_route_table.rtb_private_az1.id}"
}

// MQ 
resource "aws_route_table_association" "private_subnet_mq_az0" {
  subnet_id       = "${var.subnet_private_mq_az0}"
  route_table_id  = "${aws_route_table.rtb_private_az0.id}"
}

resource "aws_route_table_association" "private_subnet_mq_az1" {
  subnet_id       = "${var.subnet_private_mq_az1}"
  route_table_id  = "${aws_route_table.rtb_private_az1.id}"
}

// RDS
resource "aws_route_table_association" "private_subnet_rds_az0" {
  subnet_id       = "${var.subnet_private_rds_az0}"
  route_table_id  = "${aws_route_table.rtb_private_az0.id}"
}

resource "aws_route_table_association" "private_subnet_rds_az1" {
  subnet_id       = "${var.subnet_private_rds_az1}"
  route_table_id  = "${aws_route_table.rtb_private_az1.id}"
}
