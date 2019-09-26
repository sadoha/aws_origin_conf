output "sg_instance_id" {
  value = "${aws_security_group.instance.id}"
}

output "sg_elb_id" {
  value = "${aws_security_group.elb.id}"
}

