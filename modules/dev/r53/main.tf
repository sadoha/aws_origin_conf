resource "aws_route53_zone" "route53_zone" {
  name 				= "${var.domain_name}"
  force_destroy 		= "false"
  tags 	= "${merge(map("Name", "r53-${var.domain_name}-${var.name}-${var.env}"), var.tags)}"
}

resource "aws_route53_record" "route53_record" {
  zone_id 			= "${aws_route53_zone.route53_zone.zone_id}"
  name    			= "${var.domain_name}"
  type    			= "A"

  alias {
    name              		= "${var.lb_name}"
    zone_id             	= "${var.lb_zone_id}"
    evaluate_target_health 	= "true"
  }
}

resource "aws_route53_record" "route53_mx" {
  zone_id 			= "${aws_route53_zone.route53_zone.zone_id}"
  name   	 		= "${var.domain_name}"
  type    			= "MX"
  ttl 				= "${var.ttl}"
  
  records 			= [
    				"1 ASPMX.L.GOOGLE.COM",
    				"5 ALT1.ASPMX.L.GOOGLE.COM",
    				"5 ALT2.ASPMX.L.GOOGLE.COM",
    				"10 ASPMX2.GOOGLEMAIL.COM",
    				"10 ASPMX3.GOOGLEMAIL.COM",  
  ]
}
