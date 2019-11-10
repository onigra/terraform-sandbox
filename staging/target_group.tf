resource "aws_lb_target_group" "app" {
  name        = "${var.short_env}-${var.app_name}-app"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.vpc.id}"
  target_type = "instance"

  tags {
    Name        = "${var.short_env}-${var.app_name}-app"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
    Role        = "app"
  }
}
