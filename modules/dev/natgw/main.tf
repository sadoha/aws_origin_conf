resource "aws_eip" "eip_nat_gateway_az0" {
  vpc      	= true
  tags   	= "${merge(map("Name", "eip-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_eip" "eip_nat_gateway_az1" {
  vpc      	= true
  tags   	= "${merge(map("Name", "eip-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_nat_gateway" "nat_gateway_az0" {
  allocation_id = "${aws_eip.eip_nat_gateway_az0.id}"
  subnet_id     = "${var.subnet_public_az0}"
  tags   	= "${merge(map("Name", "natgw-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = "${aws_eip.eip_nat_gateway_az1.id}"
  subnet_id     = "${var.subnet_public_az0}"
  tags   	= "${merge(map("Name", "natgw-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}
