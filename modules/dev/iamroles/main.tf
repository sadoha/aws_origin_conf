resource "aws_iam_role" "s3asg" {
  name = "AWSServiceRoletForASGToConnectToS3"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags   = "${merge(map("Name", "iam-s3asg-${var.env}-${var.name}"), var.tags)}"
}

resource "aws_iam_instance_profile" "s3asg" {
  name = "AWSServiceRoletForASGToConnectToS3"
  role = "${aws_iam_role.s3asg.name}"
}

resource "aws_iam_role_policy" "s3asg" {
  name = "AWSServiceRoletForASGToConnectToS3"
  role = "${aws_iam_role.s3asg.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${var.s3_bucket}",
        "arn:aws:s3:::${var.s3_bucket}/*"
      ]
    }
  ]
}
EOF
}
