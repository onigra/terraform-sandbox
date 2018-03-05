resource "aws_lb_target_group" "web" {
  name        = "${var.short_env}-${var.app_name}-web"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.vpc.id}"
  target_type = "instance"

  tags {
    Name        = "${var.short_env}-${var.app_name}-web"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
    Role        = "web"
  }
}
