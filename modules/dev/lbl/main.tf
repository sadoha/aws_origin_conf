resource "aws_lb_listener" "lb_listener_80" {
  load_balancer_arn             = "${var.load_balancer_arn}"
  protocol                      = "HTTP"
  port                          = "80"

  default_action {
    target_group_arn            = "${var.target_group_arn}"
    type                        = "forward"
  }
}
