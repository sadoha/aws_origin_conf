data "template_file" "bastion_template_file" {
  template = "${file("templates/bastion_template_file.tpl")}"
}

// Bastion 
resource "aws_instance" "instance_ci_bastion" {
  ami                         	= "${lookup(var.amis,var.region)}"
  instance_type               	= "${var.instance_type}"
  key_name                    	= "${var.key_name}"
  subnet_id                   	= "${var.subnet_public_az1}"
  associate_public_ip_address 	= "true"
  monitoring                  	= "true"
  iam_instance_profile 		= "${var.iam_instance_profile}"
  user_data = "${data.template_file.bastion_template_file.rendered}"

  root_block_device {
    volume_type 		= "${var.volume_type}"
    volume_size 		= "${var.volume_size}"
    iops                  	= "${var.iops}"
    encrypted             	= "false"
    delete_on_termination 	= "true"
  }

  vpc_security_group_ids      	= ["${var.security_group}"]

/*
  provisioner "remote-exec" {
    inline 			= [
      	"sudo yum install epel-release.noarch -y",
      	"sudo yum install httpd python-pip unzip -y",
	"curl 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip' -o 'awscli-bundle.zip'",
	"unzip awscli-bundle.zip",
	"sudo ./awscli-bundle/install -b ~/bin/aws",
    ]
  }
  
  connection {
    type        = "ssh"
    user        = "centos"
    host 	= "${self.public_ip}"
    private_key = "${file("./ssh_dev_key_ec2")}"
  }  
*/  
  tags   = "${merge(map("Name", "ec2-bastion-${var.azs[1]}-${var.env}-${var.name}"), var.tags)}"

  volume_tags = {
    Name                	= "ebs-bastion-${var.azs[1]}-${var.env}-${var.name}"
    Infra               	= "${var.name}"
    Terraformed         	= "true"
    Snapshot            	= "${var.env}"
  }
}


