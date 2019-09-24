resource "aws_internet_gateway" "ig" {
  vpc_id = "${var.vpc}"
  tags   = "${merge(map("Name", "ig-${var.name}-${var.env}"), var.tags)}"
}
