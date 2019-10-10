resource "aws_autoscaling_group" "web" {
  name                          	= "asg-web-${var.env}-${var.name}"
  vpc_zone_identifier           	= ["${var.subnet_private_az0}", "${var.subnet_private_az1}"]
  target_group_arns			= ["${var.target_group_80_arn}"]
  force_delete                  	= "true"
  health_check_grace_period     	= 60
  min_size                     	 	= 1
  max_size                      	= 2
  health_check_type            		= "EC2"

  launch_template {
    id 					= "${var.launch_template_id}"
    version 				= "${var.launch_template_version}"
  }

  lifecycle {
    create_before_destroy 		= "true"
  }
}
