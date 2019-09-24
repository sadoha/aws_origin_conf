output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "ig_id" {
  value = "${module.ig.ig_id}"
}
