resource "aws_elb" "elb" {
  name                          = "dev-elb"
  security_groups               = ["${var.security_groups}"]
  subnets                       = ["${var.subnet_private_az0}", "${var.subnet_private_az1}"]

  cross_zone_load_balancing     = "true"

  health_check {
    healthy_threshold           = 2
    unhealthy_threshold         = 2
    timeout                     = 3
    interval                    = 30
    target                      = "HTTP:80/"
  }

  listener {
    lb_port                     = 80
    lb_protocol                 = "http"
    instance_port               = "80"
    instance_protocol           = "http"
  }

  tags   = "${merge(map("Name", "elb-${var.env}-${var.name}"), var.tags)}"

}
