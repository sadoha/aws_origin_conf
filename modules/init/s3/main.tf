resource "aws_s3_bucket" "tslog_bucket" {
  bucket 		= "s3-tslogs-bucket-${var.env}-${var.name}"
  acl 			= "log-delivery-write"

  versioning {
    enabled             = "true"
  }

  lifecycle {
    prevent_destroy     = "false"
  }

  tags   = "${merge(map("Name", "s3-tslogs-bucket-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket                = "s3-terraform-state-${var.env}-${var.name}"
  acl                   = "private"

  versioning {
    enabled             = "true"
  }

  lifecycle {
    prevent_destroy     = "false"
  }

  logging {
    target_bucket 	= "${aws_s3_bucket.tslog_bucket.id}"
    target_prefix 	= "log/"
  }

  tags   = "${merge(map("Name", "s3-terraform-state-${var.env}-${var.name}"), var.tags)}"
}
