resource "aws_autoscaling_group" "ec2_asg" {
  name                          	= "${var.env}_ec2_autoscaling_group"
  launch_configuration          	= "${var.ec2_launch_conf}"
  vpc_zone_identifier           	= ["${var.subnet_private_az0}", "${var.subnet_private_az1}"]
  force_delete                  	= "true"
  health_check_grace_period     	= 120
  min_size                     	 	= 2
  max_size                      	= 3
  load_balancers               		= ["${var.elb}"]
  health_check_type            		= "ELB"
}
