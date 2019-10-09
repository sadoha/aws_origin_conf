output "zone_name" {
  value = replace(join("", aws_route53_zone.route53_zone.*.name), "/\\.$/", "")
}

output "ns" {
  value = "${aws_route53_zone.route53_zone.name_servers}"
}
