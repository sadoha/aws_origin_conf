output "sg_bastion_id" {
  value = "${aws_security_group.bastion.id}"
}

output "sg_instance_id" {
  value = "${aws_security_group.instance.id}"
}

output "sg_lb_id" {
  value = "${aws_security_group.lb.id}"
}

output "sg_mq_broker_id" {
  value = "${aws_security_group.mq_broker.id}"
}

output "sg_elasticache_id" {
  value = "${aws_security_group.elasticache.id}"
}

output "sg_rds_id" {
  value = "${aws_security_group.rds.id}"
}

