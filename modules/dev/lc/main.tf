resource "aws_launch_configuration" "ec2_launch_conf" {
  name                          = "${var.env}_ec2_launch_conf"
  image_id                      = "${lookup(var.amis,var.region)}"
  instance_type                 = "${var.instance_type}"
  security_groups               = ["${var.security_group}"]
  key_name                      = "${var.key_name}"
  associate_public_ip_address 	= "false"
  enable_monitoring		= "true"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo chmod 777 /var/www/html/
              sudo echo "test" >  /var/www/html/index.html
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF

  root_block_device {
    delete_on_termination       = "true"
    encrypted                   = "false"
    iops                        = "${var.iops}"
    volume_type                 = "${var.volume_type}"
    volume_size                 = "${var.volume_size}"
  }

  enable_monitoring             = "true"

  lifecycle {
    create_before_destroy       = "true"
  }
}
