output "db_instance_password" {
  value = "${random_string.rds_password.result}"
}

output "db_instance_dbname" {
  description = "The database name"
  value       = "${aws_db_instance.db_instance_db0.name}"
}

output "db_instance_username" {
  description = "The user name"
  value       = "${aws_db_instance.db_instance_db0.username}"
}

output "db_instance_endpoint" {
  description = "The database endpoint"
  value       = "${aws_db_instance.db_instance_db0.endpoint}"
}

output "db_instance_replica_endpoint1" {
  description = "The database replica endpoint"
  value       = "${aws_db_instance.db_instance_db1.endpoint}"
}

output "db_instance_replica_endpoint2" {
  description = "The database replica endpoint"
  value       = "${aws_db_instance.db_instance_db2.endpoint}"
}
