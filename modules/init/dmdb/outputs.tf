output "dmdb_terraform_state_lock_id" {
  value = "${aws_dynamodb_table.dmdb_terraform_state_lock.id}"
}
