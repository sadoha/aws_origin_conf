data "template_file" "web_template_file" {
  template = "${file("templates/web_template_file.tpl")}"

  vars = {
    s3_bucket = "${var.s3_bucket}"
  }
}

resource "aws_launch_template" "web" {
  name_prefix   		= "lat-web-${var.env}-${var.name}"
  image_id      		= "${lookup(var.amis,var.region)}"
  instance_type 		= "${var.instance_type}"
  key_name                      = "${var.key_name}"
  user_data 			= "${base64encode(data.template_file.web_template_file.rendered)}"

  iam_instance_profile {       
    name			= "${var.iam_instance_profile}"
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      delete_on_termination 	= "true"
      encrypted                 = "false"
      iops                      = "${var.iops}"
      volume_type               = "${var.volume_type}"
      volume_size               = "${var.volume_size}"
    }
  }

  network_interfaces {
    associate_public_ip_address = "false"
    delete_on_termination       = "true"
    security_groups		= ["${var.security_group}"]
  }

  credit_specification {
    cpu_credits 		= "standard"
  }

  monitoring {
    enabled 			= "true"
  }

  lifecycle {
    create_before_destroy 	= "true"
  }

  tag_specifications {
    resource_type 		= "instance"

    tags = {
      Name 			= "asg-web-${var.env}-${var.name}"
    }
  }

  tag_specifications {
    resource_type 		= "volume"

    tags = {
      Name 			= "asg-web-${var.env}-${var.name}"
      Infra                     = "${var.name}"
      Terraformed               = "true"
      Snapshot                  = "${var.env}"
    }
  }
 
  tags   = "${merge(map("Name", "lat-web-${var.env}-${var.name}"), var.tags)}"
}











