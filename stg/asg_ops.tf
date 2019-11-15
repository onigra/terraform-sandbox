module "ops_instance_profile" {
  source = "./modules/iam/ops_instance_profile"
}

resource "aws_launch_template" "ops" {
  name                                 = "${var.env}-${var.app_name}-ops"
  description                          = "ops server"
  image_id                             = "${data.aws_ami.ubuntu_1804.id}"
  instance_type                        = "t2.micro"
  vpc_security_group_ids               = ["${aws_security_group.app.id}"]
  instance_initiated_shutdown_behavior = "terminate"

  iam_instance_profile {
    arn = "${module.ops_instance_profile.ops_instance_profile_arn}"
  }

  lifecycle {
    ignore_changes = ["image_id", "user_data", "latest_version"]
  }
}

resource "aws_autoscaling_group" "ops" {
  name                = "${var.env}-${var.app_name}-ops"
  vpc_zone_identifier = ["${module.network.private_1c}", "${module.network.private_1d}"]

  desired_capacity = 0
  max_size         = 0
  min_size         = 0

  launch_template {
    id      = "${aws_launch_template.ops.id}"
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.env}-${var.app_name}-ops"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = ["desired_capacity", "max_size", "min_size"]
  }
}
