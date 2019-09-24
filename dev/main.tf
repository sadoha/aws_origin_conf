module "trs" {
  source                = "../modules/dev/trs"
  region                = "${var.region}"
}


module "vpc" {
  source                = "../modules/dev/vpc"
  name                  = "${var.name}"
  env                   = "${var.env}"

  tags = {
    Infra               = "${var.name}"
    Terraformed         = "true"
  }
}
