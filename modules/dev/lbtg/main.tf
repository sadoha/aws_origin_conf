resource "aws_lb_target_group" "lb_target_group_80" {
  name                          = "tg-${var.env}-80"
  protocol                      = "HTTP"
  port                          = "80"
  vpc_id                        = "${var.vpc}"

  tags   = "${merge(map("Name", "tg-${var.env}-80"), var.tags)}"
}

