#!/bin/bash

export name="${name}"
export env="${env}"
export s3_bucket="${s3_bucket}"

# Installing packages
yum install epel-release.noarch -y
yum install vim httpd python-pip unzip -y

# Enabling web server
systemctl start httpd
systemctl enable httpd

# Installing AWS CLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -b ~/bin/aws

# Copying an index.html file from S3 
/root/bin/aws s3 cp s3://${s3_bucket}/index.tpl /tmp/index.tpl

# Creating the default index file
chmod 777 /var/www/html/
/bin/bash -c "envsubst < /tmp/index.tpl > /var/www/html/index.html"
