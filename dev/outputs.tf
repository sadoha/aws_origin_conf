output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "ig_id" {
  value = "${module.ig.ig_id}"
}

output "subnet_public_az0_id" {
  value = "${module.subnet.subnet_public_az0_id}"
}

output "subnet_public_az1_id" {
  value = "${module.subnet.subnet_public_az1_id}"
}

output "subnet_private_az0_id" {
  value = "${module.subnet.subnet_private_az0_id}"
}

output "subnet_private_az1_id" {
  value = "${module.subnet.subnet_private_az1_id}"
}

output "sg_bastion_id" {
  value = "${module.sg.sg_bastion_id}"
}

output "sg_instance_id" {
  value = "${module.sg.sg_instance_id}"
}

output "sg_lb_id" {
  value = "${module.sg.sg_lb_id}"
}

output "ssh_pair_ec2_id" {
  value = "${module.key.ssh_pair_ec2_id}"
}

output "ec2_launch_conf_id" {
  value = "${module.lc.ec2_launch_conf_id}"
}

output "nat_gateway_az0_id" {
  value = "${module.natgw.nat_gateway_az0_id}"
}

output "nat_gateway_az1_id" {
  value = "${module.natgw.nat_gateway_az1_id}"
}

output "lb_id" {
  value = "${module.lb.lb_id}"
}

output "lb_arn" {
  value = "${module.lb.lb_arn}"
}

output "lb_target_group_80_arn" {
  value = "${module.lbtg.lb_target_group_80_arn}"
}

