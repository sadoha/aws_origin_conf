resource "aws_lb" "lb" {
  name                          	= "alb-${var.env}"
  security_groups               	= ["${var.security_groups}"]
  subnets                       	= ["${var.subnet_public_az0}", "${var.subnet_public_az1}"]
  internal                              = "false"
  enable_cross_zone_load_balancing      = "true"
  enable_deletion_protection            = "false"

  tags   = "${merge(map("Name", "lb-${var.env}-${var.name}"), var.tags)}"

}

