resource "aws_lb" "web" {
  name               = "${var.short_env}-${var.app_name}-alb"
  load_balancer_type = "application"
  internal           = false

  # これがtrueだとdestroyでまとめて消せなくて厄介なのでfalseにしておく
  enable_deletion_protection = false

  security_groups = ["${aws_security_group.alb.id}"]
  subnets         = ["${aws_subnet.public_1d.id}", "${aws_subnet.public_1c.id}"]

  tags {
    Name        = "${var.short_env}-${var.app_name}-alb"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}

resource "aws_lb_target_group_attachment" "web" {
  target_group_arn = "${aws_lb_target_group.web.arn}"
  target_id        = "${aws_instance.internal.id}"
  port             = 80
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = "${aws_lb.web.arn}"
  port              = "80"
  protocol          = "HTTP"

  # ssl_policy        = ""
  # certificate_arn   = ""

  default_action {
    target_group_arn = "${aws_lb_target_group.web.arn}"
    type             = "forward"
  }
}
