output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}
