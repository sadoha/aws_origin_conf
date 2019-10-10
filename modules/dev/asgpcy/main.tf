resource "aws_autoscaling_policy" "heavy_out" {
  name 					= "heavy-out-asg-policy"
  scaling_adjustment 			= 1
  adjustment_type 			= "ChangeInCapacity"
  cooldown 				= 10
  autoscaling_group_name 		= "${var.asg_group_name}"
}

resource "aws_autoscaling_policy" "heavy_in" {
  name 					= "heavy-in-asg-policy"
  scaling_adjustment 			= -1
  adjustment_type 			= "ChangeInCapacity"
  cooldown 				= 10
  autoscaling_group_name 		= "${var.asg_group_name}"
}
