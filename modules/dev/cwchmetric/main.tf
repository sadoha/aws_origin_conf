resource "aws_cloudwatch_metric_alarm" "heavy_asg_cpu_usage_is_very_high" {
  alarm_name 				= "heavy-asg-cpu-usage-is-very-high"
  comparison_operator 			= "GreaterThanOrEqualToThreshold"
  evaluation_periods 			= 1
  metric_name 				= "CPUUtilization"
  namespace 				= "AWS/EC2"
  period 				= 60
  statistic 				= "Average"
  threshold 				= 80

  dimensions = {
    AutoScalingGroupName 		= "${var.asg_group_name}"
  }

  alarm_description 			= "This metric monitors EC2 CPU utilization"
  alarm_actions 			= ["${var.alarm_actions_heavy_out}"]

  tags   = "${merge(map("Name", "high-in-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_cloudwatch_metric_alarm" "heavy_asg_cpu_usage_is_very_low" {
  alarm_name 				= "heavy-asg-cpu-usage-is-very-low"
  comparison_operator 			= "LessThanOrEqualToThreshold"
  evaluation_periods 			= 1
  metric_name 				= "CPUUtilization"
  namespace 				= "AWS/EC2"
  period 				= 60
  statistic 				= "Average"
  threshold 				= 40

  dimensions = {
    AutoScalingGroupName 		= "${var.asg_group_name}"
  }

  alarm_description 			= "This metric monitors EC2 CPU utilization"
  alarm_actions 			= ["${var.alarm_actions_heavy_in}"]

  tags   = "${merge(map("Name", "low-in-${var.env}-${var.name}"), var.tags)}"
}
