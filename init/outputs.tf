output "s3_terraform_state_id" {
  value = "${module.s3.s3_terraform_state_id}"
}

output "dmdb_terraform_state_lock_id" {
  value = "${module.dmdb.dmdb_terraform_state_lock_id}"
}
