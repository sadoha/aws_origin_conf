data "terraform_remote_state" "tfstate" {
  backend = "s3"

  config = {
    bucket  = "${var.bucket}"
    key     = "${var.key}"
    region  = "${var.region}"
  }
}
