output "s3_terraform_state_id" {
  value = "${aws_s3_bucket.terraform_state.id}"
}
