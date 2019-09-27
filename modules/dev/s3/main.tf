resource "aws_s3_bucket" "s3_log_bucket" {
  bucket = "s3-logs-bucket-${var.env}-${var.name}"
  acl = "log-delivery-write"

  versioning {
    enabled             = "true"
  }

  lifecycle {
    prevent_destroy     = "false"
  }

  tags   = "${merge(map("Name", "s3-logs-bucket-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_s3_bucket" "s3_web_state" {
  bucket                = "s3-web-${var.env}-${var.name}"
  acl                   = "public-read-write"
  #acl                   = "private"

  versioning {
    enabled             = "true"
  }

  lifecycle {
    prevent_destroy     = "false"
  }

  logging {
    target_bucket = "${aws_s3_bucket.s3_log_bucket.id}"
    target_prefix = "logs/web/"
  }

  tags   = "${merge(map("Name", "s3-web-${var.env}-${var.name}"), var.tags)}"
}
