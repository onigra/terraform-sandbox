resource "aws_lb" "app" {
  name               = "${var.env}-${var.app_name}-alb"
  load_balancer_type = "application"
  internal           = false

  # これがtrueだとdestroyでまとめて消せなくて厄介なのでfalseにしておく
  enable_deletion_protection = false

  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = ["${aws_subnet.public_1d.id}", "${aws_subnet.public_1c.id}"]

  tags {
    Name = "${var.env}-${var.app_name}-alb"
    env  = "${var.env}"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = "${aws_lb.app.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.app.arn}"
    type             = "forward"
  }
}

# resource "aws_lb_listener" "https" {
#   load_balancer_arn = "${aws_lb.app.arn}"
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = "${aws_acm_certificate.app.arn}"
#
#   default_action {
#     target_group_arn = "${aws_lb_target_group.app.arn}"
#     type             = "forward"
#   }
# }
