output "sg_bastion_id" {
  value = "${aws_security_group.bastion.id}"
}

output "sg_instance_id" {
  value = "${aws_security_group.instance.id}"
}

output "sg_lb_id" {
  value = "${aws_security_group.lb.id}"
}

