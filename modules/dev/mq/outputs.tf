output "mq_username" {
  value = "${var.username}"
}

output "mq_password" {
  value = "${random_string.mq_broker_password.result}"
}

output "mq_primary_console_url" {
  value = "${aws_mq_broker.mq_broker.instances.0.console_url}"
}

output "mq_primary_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.0.endpoints.0}"
}

output "mq_primary_amqp_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.0.endpoints.1}"
}

output "mq_primary_stomp_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.0.endpoints.2}"
}

output "mq_primary_mqtt_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.0.endpoints.3}"
}

output "mq_primary_wss_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.0.endpoints.4}"
}

output "mq_primary_ip_address" {
  value = "${aws_mq_broker.mq_broker.instances.0.ip_address}"
}

output "mq_secondary_console_url" {
  value = "${aws_mq_broker.mq_broker.instances.1.console_url}"
}

output "mq_secondary_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.1.endpoints.0}"
}

output "mq_secondary_amqp_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.1.endpoints.1}"
}

output "mq_secondary_stomp_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.1.endpoints.2}"
}

output "mq_secondary_mqtt_ssl_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.1.endpoints.3}"
}

output "mq_secondary_wss_endpoint" {
  value = "${aws_mq_broker.mq_broker.instances.1.endpoints.4}"
}

output "mq_secondary_ip_address" {
  value = "${aws_mq_broker.mq_broker.instances.1.ip_address}"
}
