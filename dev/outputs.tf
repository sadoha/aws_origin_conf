//Load balancers
output "lb_dns_name" {
  value = "${module.lb.lb_dns_name}"
}


// Amazon MQ
output "mq_username" {
  value = "${module.mq.mq_username}"
}

output "mq_password" {
  value = "${module.mq.mq_password}"
}

output "mq_primary_console_url" {
  value = "${module.mq.mq_primary_console_url}"
}

output "mq_primary_ssl_endpoint" {
  value = "${module.mq.mq_primary_ssl_endpoint}"
}

output "mq_primary_amqp_ssl_endpoint" {
  value = "${module.mq.mq_primary_amqp_ssl_endpoint}"
}

output "mq_primary_stomp_ssl_endpoint" {
  value = "${module.mq.mq_primary_stomp_ssl_endpoint}"
}

output "mq_primary_mqtt_ssl_endpoint" {
  value = "${module.mq.mq_primary_mqtt_ssl_endpoint}"
}

output "mq_primary_wss_endpoint" {
  value = "${module.mq.mq_primary_wss_endpoint}"
}

output "mq_primary_ip_address" {
  value = "${module.mq.mq_primary_ip_address}"
}


output "mq_secondary_console_url" {
  value = "${module.mq.mq_primary_console_url}"
}

output "mq_secondary_ssl_endpoint" {
  value = "${module.mq.mq_secondary_ssl_endpoint}"
}

output "mq_secondary_amqp_ssl_endpoint" {
  value = "${module.mq.mq_secondary_amqp_ssl_endpoint}"
}

output "mq_secondary_stomp_ssl_endpoint" {
  value = "${module.mq.mq_secondary_stomp_ssl_endpoint}"
}

output "mq_secondary_mqtt_ssl_endpoint" {
  value = "${module.mq.mq_secondary_mqtt_ssl_endpoint}"
}

output "mq_secondary_wss_endpoint" {
  value = "${module.mq.mq_secondary_wss_endpoint}"
}

output "mq_secondary_ip_address" {
  value = "${module.mq.mq_secondary_ip_address}"
}
