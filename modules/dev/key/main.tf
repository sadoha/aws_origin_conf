resource "aws_key_pair" "ssh_pair_ec2" {
  key_name  	= "ssh-${var.env}-key-ec2"
  public_key 	= "${file("./keys/ssh_dev_key_ec2.pub")}"
}

