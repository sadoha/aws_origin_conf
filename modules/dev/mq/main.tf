resource "random_string" "mq_broker_password" {
  length 		= "16" 
  special 		= "false"
}

resource "aws_mq_broker" "mq_broker" {
  broker_name           = "mq-broker-${var.env}-${var.name}"
  apply_immediately     = "true"
  engine_type           = "${var.engine_type}"
  engine_version        = "${var.engine_version}"
  host_instance_type    = "${var.host_instance_type}"
  deployment_mode       = "ACTIVE_STANDBY_MULTI_AZ"
  publicly_accessible   = "false"
  security_groups       = ["${var.security_groups}"]

  configuration {
    id                  = "${aws_mq_configuration.mq_conf.id}"
    revision            = "${aws_mq_configuration.mq_conf.latest_revision}"
  }

  subnet_ids            = [
                                "${var.subnet_private_az0}",
                                "${var.subnet_private_az1}"
                          ]

  user {
    username            = "${var.username}"
    password            = "${random_string.mq_broker_password.result}"
    console_access      = "true"
  }

  logs {
    general             = "true"
    audit               = "false"
  }

  tags   = "${merge(map("Name", "mq-broker-${var.env}-${var.name}"), var.tags)}"

}


resource "aws_mq_configuration" "mq_conf" {
  description           = "Example Configuration"
  name                  = "mq-conf-${var.env}-${var.name}"
  engine_type           = "${var.engine_type}"
  engine_version        = "${var.engine_version}"

  tags   = "${merge(map("Name", "mq-conf-${var.env}-${var.name}"), var.tags)}"

  data                  = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA
}
