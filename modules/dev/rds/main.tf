resource "random_string" "rds_password" {
  length 	= 16
  min_lower   	= 1
  min_numeric 	= 1
  min_special 	= 0
  min_upper   	= 1
  special 	= false
}

resource "aws_db_subnet_group" "subnet_group_rds" {
  name                          = "subnet-group-rds-${var.env}-${var.name}"
  description                   = "Private subnets for RDS instance"
  subnet_ids  			= [ 
					"${var.subnet_private_az0}", 
					"${var.subnet_private_az1}" 
				  ]

  tags   = "${merge(map("Name", "subnet-group-rds-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_db_instance" "db_instance_db0" {
  identifier                    = "rds-db0-${var.azs[0]}-${var.env}-${var.name}"
  allocated_storage             = "${var.storage}"
  engine                        = "${var.engine}"
  engine_version                = "${var.engine_version}"
  instance_class                = "${var.instance}"
  storage_type			= "${var.storage_type}"
  name                          = "${var.env}db"
  username                      = "${var.env}user"
  password                      = "${random_string.rds_password.result}"
  vpc_security_group_ids        = ["${var.security_groups}"]
  db_subnet_group_name          = "${aws_db_subnet_group.subnet_group_rds.name}"
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  storage_encrypted             = "true"
  kms_key_id                    = "${var.kms_key}"
  availability_zone             = "${var.azs[0]}"
  port                          = "${var.port}"
  multi_az                      = "false"
  publicly_accessible           = "true"
  copy_tags_to_snapshot         = "true"
  deletion_protection           = "false"
  backup_retention_period       = "${var.backup_retention_period}"
  auto_minor_version_upgrade    = "false"
  allow_major_version_upgrade   = "false"
  apply_immediately             = "true"
  skip_final_snapshot		= "true"

  tags   = "${merge(map("Name", "rds-db0--multi-az-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_db_instance" "db_instance_db1" {
  identifier                    = "rds-db1-${var.azs[1]}-${var.env}-${var.name}"
  replicate_source_db           = "${aws_db_instance.db_instance_db0.identifier}"
  allocated_storage             = "${var.storage}"
  engine                        = "${var.engine}"
  engine_version                = "${var.engine_version}"
  instance_class                = "${var.instance}"
  storage_type			= "${var.storage_type}"
  vpc_security_group_ids        = ["${var.security_groups}"]
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  storage_encrypted             = "true"
  kms_key_id                    = "${var.kms_key}"
  availability_zone		= "${var.azs[1]}"
  port                          = "${var.port}"
  multi_az                      = "false"
  publicly_accessible           = "true"
  copy_tags_to_snapshot         = "true"
  deletion_protection           = "false"
  auto_minor_version_upgrade  	= "false"
  allow_major_version_upgrade 	= "false"
  apply_immediately		= "true"
  skip_final_snapshot		= "true"

  tags   = "${merge(map("Name", "rds-db1-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_db_instance" "db_instance_db2" {
  identifier                    = "rds-db2-${var.azs[0]}-${var.env}-${var.name}"
  replicate_source_db           = "${aws_db_instance.db_instance_db0.identifier}"
  allocated_storage             = "${var.storage}"
  engine                        = "${var.engine}"
  engine_version                = "${var.engine_version}"
  instance_class                = "${var.instance}"
  storage_type                  = "${var.storage_type}"
  vpc_security_group_ids        = ["${var.security_groups}"]
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  storage_encrypted             = "true"
  kms_key_id                    = "${var.kms_key}"
  availability_zone             = "${var.azs[0]}"
  port                          = "${var.port}"
  multi_az                      = "false"
  publicly_accessible           = "true"
  copy_tags_to_snapshot         = "true"
  deletion_protection           = "false"
  auto_minor_version_upgrade    = "false"
  allow_major_version_upgrade   = "false"
  apply_immediately             = "true"
  skip_final_snapshot         = "true"

  tags   = "${merge(map("Name", "rds-db2-${var.azs[0]}-${var.env}-${var.name}"), var.tags)}"
}
