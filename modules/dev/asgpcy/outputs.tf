output "asg_policy_heavy_out_arn" {
  value = "${aws_autoscaling_policy.heavy_out.arn}"
}

output "asg_policy_heavy_in_arn" {
  value = "${aws_autoscaling_policy.heavy_in.arn}"
}
