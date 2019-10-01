resource "aws_elasticache_subnet_group" "redis" {
  name       	= "redis-${var.env}-${var.name}"
  subnet_ids  	= [ "${var.subnet_private_az0}", "${var.subnet_private_az1}" ]
}

resource "aws_elasticache_subnet_group" "memcached" {
  name       	= "memcached-${var.env}-${var.name}"
  subnet_ids  	= [ "${var.subnet_private_az0}", "${var.subnet_private_az1}" ]
}

resource "aws_elasticache_cluster" "memcached" {
  cluster_id                    = "mcd-cross-az-${var.env}-${var.name}"
  engine                        = "memcached"
  engine_version                = "${var.memcached_engine_version}"
  node_type                     = "${var.memcached_node_type}"
  num_cache_nodes               = "2"
  az_mode                       = "cross-az"
  parameter_group_name          = "default.memcached1.5"
  subnet_group_name             = "memcached-${var.env}-${var.name}"
  security_group_ids            = ["${var.security_group}"]
  port                          = "${var.memcached_port}"

  tags   = "${merge(map("Name", "memcached-cross-az-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "redis-cross-az-${var.env}-${var.name}"
  replication_group_description = "redis-cross-az-${var.env}-${var.name}"
  node_type                     = "${var.redis_node_type}"
  port                          = "${var.redis_port}"
  parameter_group_name          = "default.redis5.0.cluster.on"
  security_group_ids            = ["${var.security_group}"]
  automatic_failover_enabled    = "true"
  engine                        = "redis"
  engine_version                = "${var.redis_engine_version}"
  apply_immediately             = "true"
  subnet_group_name             = "redis-${var.env}-${var.name}"
  at_rest_encryption_enabled    = "true"
  transit_encryption_enabled    = "true"
  snapshot_retention_limit      = "0"

  tags   = "${merge(map("Name", "redis-cross-az-${var.env}-${var.name}"), var.tags)}"

  cluster_mode {
    replicas_per_node_group = "2"
    num_node_groups         = "1"
  }
}

