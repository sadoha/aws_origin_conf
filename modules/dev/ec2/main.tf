// Bastion 
resource "aws_instance" "instance_ci_bastion" {
  ami                         	= "${lookup(var.amis,var.region)}"
  instance_type               	= "${var.instance_type}"
  key_name                    	= "${var.key_name}"
  subnet_id                   	= "${var.subnet_public_az1}"
  associate_public_ip_address 	= "true"
  monitoring                  	= "true"

  root_block_device {
    volume_type 		= "${var.volume_type}"
    volume_size 		= "${var.volume_size}"
    iops                  	= "${var.iops}"
    encrypted             	= "false"
    delete_on_termination 	= "true"
  }

  vpc_security_group_ids      	= ["${var.security_group}"]

  tags   = "${merge(map("Name", "ec2-bastion-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"

  volume_tags = {
    Name                	= "ebs-bastion-${var.azs[1]}-${var.env}-${var.name}"
    Infra               	= "${var.name}"
    Terraformed         	= "true"
    Snapshot            	= "${var.env}"
  }
}


