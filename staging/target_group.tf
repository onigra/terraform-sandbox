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
resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = "${aws_lb_target_group.app.arn}"
  target_id        = "${aws_instance.app.id}"
  port             = 80
}
