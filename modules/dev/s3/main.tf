resource "aws_s3_bucket" "s3logs" {
  bucket 		= "s3-s3logs-${var.env}-${var.name}"
  acl 			= "log-delivery-write"
  force_destroy 	= "true"

  versioning {
    enabled             = "true"
  }

  lifecycle {
    prevent_destroy     = "false"
  }

  tags   = "${merge(map("Name", "s3-s3logs-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_s3_bucket" "asg" {
  bucket                = "s3-asg-${var.env}-${var.name}"
  acl                   = "private"
  force_destroy 	= "true"

/*
  server_side_encryption_configuration {
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "${var.kms_key}"
      sse_algorithm     = "aws:kms"
      }
    }
  }
*/
  versioning {
    enabled             = "true"
  }

  lifecycle {
    prevent_destroy     = "false"
  }

  logging {
    target_bucket 	= "${aws_s3_bucket.s3logs.id}"
    target_prefix 	= "logs/asg/"
  }

  tags   = "${merge(map("Name", "s3-asg-${var.env}-${var.name}"), var.tags)}"
}

