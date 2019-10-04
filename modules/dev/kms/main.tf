resource "aws_kms_key" "s3_key" {
  policy                  = "${var.s3_key_policy}"
  enable_key_rotation     = true
  description             = "kms-s3-${var.env}-${var.name}"

  tags   = "${merge(map("Name", "kms-s3-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_kms_key" "rds_key" {
  policy                  = "${var.rds_key_policy}"
  enable_key_rotation     = "true"
  description             = "kms-rds-${var.env}-${var.name}"

  tags   = "${merge(map("Name", "kms-rds-${var.env}-${var.name}"), var.tags)}"
}
