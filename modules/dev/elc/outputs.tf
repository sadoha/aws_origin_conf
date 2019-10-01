output "redis_cluster_endpoint_address" {
  value = "${aws_elasticache_replication_group.redis.configuration_endpoint_address}"
}

output "redis_cluster_endpoint_port" {
  value = "${aws_elasticache_replication_group.redis.port}"
}

output "memcached_cluster_endpoint_address" {
  value = "${aws_elasticache_cluster.memcached.configuration_endpoint}"
}
