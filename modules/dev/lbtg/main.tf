resource "aws_lb_target_group" "lb_target_group_80" {
  name                          = "tg-80-${var.env}"
  protocol                      = "HTTP"
  port                          = "80"
  vpc_id                        = "${var.vpc}"

  tags   = "${merge(map("Name", "tg-80-${var.env}-${var.name}"), var.tags)}"
}

