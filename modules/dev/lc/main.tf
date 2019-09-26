resource "aws_launch_configuration" "ec2_launch_conf" {
  name                          = "${var.env}_ec2_launch_conf"
  image_id                      = "${lookup(var.amis,var.region)}"
  instance_type                 = "t2.micro"
  security_groups               = ["${var.security_group}"]
  key_name                      = "${var.key_name}"

  user_data = <<-EOF
              #!/bin/bash
              yum install httpd
              systemctl start httpd
              sudo systemctl enable httpd
              EOF

  root_block_device {
    delete_on_termination       = "true"
    encrypted                   = "false"
    iops                        = "0"
    volume_type                 = "standard"
    volume_size                 = "8"
  }

  enable_monitoring             = "true"

  lifecycle {
    create_before_destroy       = "true"
  }
}
