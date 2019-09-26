module "trs" {
  source                	= "../modules/dev/trs"
  region                	= "${var.region}"
}

// Amazon Virtual Private Cloud
module "vpc" {
  source                	= "../modules/dev/vpc"
  name                  	= "${var.name}"
  env                   	= "${var.env}"

  tags = {
    Infra               	= "${var.name}"
    Terraformed         	= "true"
  }
}

// Amazon Internet Gateways
module "ig" {
  source                	= "../modules/dev/ig"
  name                  	= "${var.name}"
  env                   	= "${var.env}"
  vpc                   	= "${module.vpc.vpc_id}"

  tags = {
    Infra               	= "${var.name}"
    Terraformed         	= "true"
  }
}

// Amazon Subnet
module "subnet" {
  source                	= "../modules/dev/subnet"
  name                  	= "${var.name}"
  azs                   	= "${var.azs}"
  env                   	= "${var.env}"
  vpc                		= "${module.vpc.vpc_id}"

  tags = {
    Infra               	= "${var.name}"
    Terraformed         	= "true"
  }
}

// Amazon NAT Gateways
module "natgw" {
  source                        = "../modules/dev/natgw"
  name                          = "${var.name}"
  env                           = "${var.env}"
  azs                   	= "${var.azs}"
  subnet_public_az0		= "${module.subnet.subnet_public_az0_id}"
  subnet_public_az1		= "${module.subnet.subnet_public_az1_id}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}

// Amazon Route Tables
module "rtb" {
  source                        = "../modules/dev/rtb"
  name                          = "${var.name}"
  env                           = "${var.env}"
  vpc                           = "${module.vpc.vpc_id}"
  azs                   	= "${var.azs}"
  subnet_public_az0		= "${module.subnet.subnet_public_az0_id}"
  subnet_public_az1		= "${module.subnet.subnet_public_az1_id}"
  gateway			= "${module.ig.ig_id}"
  nat_gateway_az0		= "${module.natgw.nat_gateway_az0_id}"
  nat_gateway_az1		= "${module.natgw.nat_gateway_az1_id}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}

// Amazon Security Groups
module "sg" {
  source                	= "../modules/dev/sg"
  name                  	= "${var.name}"
  env                   	= "${var.env}"
  vpc                   	= "${module.vpc.vpc_id}"

  tags = {
    Infra               	= "${var.name}"
    Terraformed         	= "true"
  }
}

// Amazon Key Pairs
module "key" {
  source                        = "../modules/dev/key"
  name                          = "${var.name}"
  env                           = "${var.env}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}

// Amazon Launch Configuration
module "lc" {
  source                        = "../modules/dev/lc"
  name                          = "${var.name}"
  env                           = "${var.env}"
  amis                          = "${var.amis}"
  region                        = "${var.region}"
  key_name                      = "${module.key.ssh_pair_ec2_id}"
  security_group               	= "${module.sg.sg_instance_id}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}

// Elastic Load Balancers
module "elb" {
  source                        = "../modules/dev/elb"
  name                          = "${var.name}"
  env                           = "${var.env}"
  vpc                           = "${module.vpc.vpc_id}"
  security_groups		= "${module.sg.sg_elb_id}"
  subnet_private_az0		= "${module.subnet.subnet_private_az0_id}"
  subnet_private_az1		= "${module.subnet.subnet_private_az1_id}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}

// Amazon AutoScaling Group
module "asg" {
  source                        = "../modules/dev/asg"
  name                          = "${var.name}"
  env                           = "${var.env}"
  subnet_private_az0            = "${module.subnet.subnet_private_az0_id}"
  subnet_private_az1            = "${module.subnet.subnet_private_az1_id}"
  ec2_launch_conf               = "${module.lc.ec2_launch_conf_id}"
  elb                           = "${module.elb.elb_id}"

  tags = {
    Infra                       = "${var.name}"
    Terraformed                 = "true"
  }
}

