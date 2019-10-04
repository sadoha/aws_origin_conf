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

// Amazon ElastiCache
output "redis_cluster_endpoint_address" {
  value = "${module.elc.redis_cluster_endpoint_address}"
}

output "redis_cluster_endpoint_port" {
  value = "${module.elc.redis_cluster_endpoint_port}"
}

output "memcached_cluster_endpoint_address" {
  value = "${module.elc.memcached_cluster_endpoint_address}"
}

// Amazon RDS
output "db_instance_password" {
  value = "${module.rds.db_instance_password}"
}

output "db_instance_dbname" {
  value = "${module.rds.db_instance_dbname}"
}

output "db_instance_username" {
  value = "${module.rds.db_instance_username}"
}

output "db_instance_endpoint" {
  value = "${module.rds.db_instance_endpoint}"
}

output "db_instance_replica_endpoint1" {
  value = "${module.rds.db_instance_replica_endpoint1}"
}

output "db_instance_replica_endpoint2" {
  value = "${module.rds.db_instance_replica_endpoint2}"
}
