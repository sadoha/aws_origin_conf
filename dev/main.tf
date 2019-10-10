// Amazon Virtual Private Cloud
module "vpc" {
  source                	= "../modules/dev/vpc"
  name                  	= "${var.name}"
  env                   	= "${var.env}"

  tags = {
    Infra               	= "${var.name}"
    Environment                 = "${var.env}"
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
    Environment                 = "${var.env}"
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
    Environment                 = "${var.env}"
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
    Environment                 = "${var.env}"
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
  subnet_private_ec2_az0	= "${module.subnet.subnet_private_ec2_az0_id}"
  subnet_private_ec2_az1	= "${module.subnet.subnet_private_ec2_az1_id}"
  subnet_private_asg_az0	= "${module.subnet.subnet_private_asg_az0_id}"
  subnet_private_asg_az1	= "${module.subnet.subnet_private_asg_az1_id}"
  subnet_private_elc_az0	= "${module.subnet.subnet_private_elc_az0_id}"
  subnet_private_elc_az1	= "${module.subnet.subnet_private_elc_az1_id}"
  subnet_private_mq_az0		= "${module.subnet.subnet_private_mq_az0_id}"
  subnet_private_mq_az1		= "${module.subnet.subnet_private_mq_az1_id}"
  subnet_private_rds_az0	= "${module.subnet.subnet_private_rds_az0_id}"
  subnet_private_rds_az1	= "${module.subnet.subnet_private_rds_az1_id}"
  gateway			= "${module.ig.ig_id}"
  nat_gateway_az0		= "${module.natgw.nat_gateway_az0_id}"
  nat_gateway_az1		= "${module.natgw.nat_gateway_az1_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
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
    Environment                 = "${var.env}"
    Terraformed         	= "true"
  }
}

// Amazon Key Management Service
module "kms" {
  source                        = "../modules/dev/kms"
  name                          = "${var.name}"
  env                           = "${var.env}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon S3 Buckets
module "s3" {
  source                        = "../modules/dev/s3"
  name                          = "${var.name}"
  env                           = "${var.env}"
  kms_key			= "${module.kms.kms_s3_key_arn}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon IAM Roles
module "iamroles" {
  source                        = "../modules/dev/iamroles"
  name                          = "${var.name}"
  env                           = "${var.env}"
  s3_bucket			= "${module.s3.s3_asg_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon Key Pairs
module "key" {
  source                        = "../modules/dev/key"
  name                          = "${var.name}"
  env                           = "${var.env}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon EC2 Instances
module "ec2" {
  source                        = "../modules/dev/ec2"
  name                          = "${var.name}"
  env                           = "${var.env}"
  azs                   	= "${var.azs}"
  amis                          = "${var.amis}"
  region                        = "${var.region}"
  iam_instance_profile		= "${module.iamroles.iam_instance_profile_s3asg_name}"
  key_name                      = "${module.key.ssh_pair_ec2_id}"
  security_group                = "${module.sg.sg_bastion_id}"
  subnet_public_az1		= "${module.subnet.subnet_public_az1_id}"
  s3_bucket			= "${module.s3.s3_asg_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon Launch Template
module "lat" {
  source                        = "../modules/dev/lat"
  name                          = "${var.name}"
  env                           = "${var.env}"
  amis                          = "${var.amis}"
  region                        = "${var.region}"
  iam_instance_profile		= "${module.iamroles.iam_instance_profile_s3asg_name}"
  key_name                      = "${module.key.ssh_pair_ec2_id}"
  security_group               	= "${module.sg.sg_instance_id}"
  s3_bucket			= "${module.s3.s3_asg_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Elastic Load Balancers
module "lb" {
  source                        = "../modules/dev/lb"
  name                          = "${var.name}"
  env                           = "${var.env}"
  vpc                           = "${module.vpc.vpc_id}"
  azs                   	= "${var.azs}"
  security_groups		= "${module.sg.sg_lb_id}"
  subnet_public_az0		= "${module.subnet.subnet_public_az0_id}"
  subnet_public_az1		= "${module.subnet.subnet_public_az1_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon Target Groups
module "lbtg" {
  source                        = "../modules/dev/lbtg"
  name                          = "${var.name}"
  env                           = "${var.env}"
  vpc                           = "${module.vpc.vpc_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon AutoScaling Group
module "asg" {
  source                        = "../modules/dev/asg"
  name                          = "${var.name}"
  env                           = "${var.env}"
  subnet_private_az0            = "${module.subnet.subnet_private_asg_az0_id}"
  subnet_private_az1            = "${module.subnet.subnet_private_asg_az1_id}"
  launch_template_id            = "${module.lat.launch_template_web_id}"
  launch_template_version	= "${module.lat.launch_template_web_latest_version}"
  target_group_80_arn		= "${module.lbtg.lb_target_group_80_arn}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon AutoScaling Policy
module "asgpcy" {
  source                        = "../modules/dev/asgpcy"
  name                          = "${var.name}"
  env                           = "${var.env}"
  asg_group_name		= "${module.asg.asg_web_name}"
	
  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon CloudWatch Metric
module "cwchmetric" {
  source                        = "../modules/dev/cwchmetric"
  name                          = "${var.name}"
  env                           = "${var.env}"
  asg_group_name		= "${module.asg.asg_web_name}"
  alarm_actions_heavy_in	= "${module.asgpcy.asg_policy_heavy_in_arn}"
  alarm_actions_heavy_out	= "${module.asgpcy.asg_policy_heavy_out_arn}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon ABL Listeners
module "lbl" {
  source                        = "../modules/dev/lbl"
  name                          = "${var.name}"
  env                           = "${var.env}"
  vpc                           = "${module.vpc.vpc_id}"
  load_balancer_arn		= "${module.lb.lb_arn}"
  target_group_arn		= "${module.lbtg.lb_target_group_80_arn}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon Route53
module "r53" {
  source                        = "../modules/dev/r53"
  name                          = "${var.name}"
  env                           = "${var.env}"
  lb_zone_id			= "${module.lb.lb_zone_id}"
  lb_name			= "${module.lb.lb_dns_name}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon ElastiCache
module "elc" {
  source                        = "../modules/dev/elc"
  name                          = "${var.name}"
  env                           = "${var.env}"
  vpc                           = "${module.vpc.vpc_id}"
  azs                   	= "${var.azs}"
  subnet_private_az0            = "${module.subnet.subnet_private_elc_az0_id}"
  subnet_private_az1            = "${module.subnet.subnet_private_elc_az1_id}"
  security_group		= "${module.sg.sg_elasticache_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon MQ
module "mq" {
  source                        = "../modules/dev/mq"
  name                          = "${var.name}"
  env                           = "${var.env}"
  security_groups               = "${module.sg.sg_mq_broker_id}"
  subnet_private_az0            = "${module.subnet.subnet_private_mq_az0_id}"
  subnet_private_az1            = "${module.subnet.subnet_private_mq_az1_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

// Amazon Relational Database Service (RDS)
module "rds" {
  source                        = "../modules/dev/rds"
  name                          = "${var.name}"
  env                           = "${var.env}"
  azs                           = "${var.azs}"
  vpc                        	= "${module.vpc.vpc_id}"
  security_groups               = "${module.sg.sg_rds_id}"
  kms_key			= "${module.kms.kms_rds_key_arn}"
  subnet_private_az0            = "${module.subnet.subnet_private_rds_az0_id}"
  subnet_private_az1            = "${module.subnet.subnet_private_rds_az1_id}"

  tags = {
    Infra                       = "${var.name}"
    Environment                 = "${var.env}"
    Terraformed                 = "true"
  }
}

