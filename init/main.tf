// Amazon S3 Buckets 
module "s3" {
  source                        = "../modules/init/s3"
  name                          = "${var.name}"
  env                           = "${var.env}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}

// Amazon DynamoDB
module "dmdb" {
  source                        = "../modules/init/dmdb"
  name                          = "${var.name}"
  env                           = "${var.env}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}
