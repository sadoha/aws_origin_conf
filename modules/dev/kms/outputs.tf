output "kms_s3_key_arn" {
  value       = "${aws_kms_key.s3_key.arn}"
  description = "S3 KMS key ARN"
}

output "kms_rds_key_arn" {
  value       = "${aws_kms_key.rds_key.arn}"
  description = "RDS KMS key ARN"
}
