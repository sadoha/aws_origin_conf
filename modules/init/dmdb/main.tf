resource "aws_dynamodb_table" "dmdb_terraform_state_lock" {
  name 			= "dmdb-terraform-state-lock-${var.env}-${var.name}"
  hash_key 		= "LockID"
  read_capacity 	= "${var.read_capacity}"
  write_capacity 	= "${var.write_capacity}"

  attribute {
    name 		= "LockID"
    type 		= "S"
  }

  tags   = "${merge(map("Name", "dmdb-terraform-state-lock-${var.env}-${var.name}"), var.tags)}"
}
