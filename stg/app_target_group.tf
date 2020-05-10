resource "aws_lb_target_group" "app" {
  name        = "${var.env}-${var.app_name}-app"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.vpc.id}"
  target_type = "instance"
  tags {
    Name = "${var.env}-${var.app_name}-app"
    env  = "${var.env}"
  }
}
