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

module "ig" {
  source                = "../modules/dev/ig"
  name                  = "${var.name}"
  env                   = "${var.env}"
  vpc                   = "${module.vpc.vpc_id}"

  tags = {
    Infra               = "${var.name}"
    Terraformed         = "true"
  }
}
