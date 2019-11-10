resource "aws_instance" "app" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.medium"
  subnet_id       = "${aws_subnet.private_1d.id}"
  security_groups = ["${aws_security_group.app.id}"]

  tags {
    Name        = "${var.short_env}-${var.app_name}-app"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
