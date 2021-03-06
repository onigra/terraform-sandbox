resource "aws_iam_role" "ops_instance_profile" {
  name = "ops-instance-profile"
  path = "/service-role/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ssm_instance_core_to_ops_instance_profile" {
  role       = "${aws_iam_role.ops_instance_profile.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ops_instance_profile" {
  name = "ops-instance-profile"
  role = "${aws_iam_role.ops_instance_profile.name}"
}

output "ops_instance_profile_arn" {
  value = "${aws_iam_instance_profile.ops_instance_profile.arn}"
}
