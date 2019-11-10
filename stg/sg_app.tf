resource "aws_security_group" "alb" {
  name        = "${var.env}-${var.app_name}-alb"
  description = "${var.env}-${var.app_name}-alb"
  vpc_id      = "${module.network.aws_vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-${var.app_name}-alb"
    env  = "${var.env}"
  }
}

resource "aws_security_group_rule" "allow_http_from_allow_ip_list" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = "${var.allow_ip_list}"
  security_group_id = "${aws_security_group.alb.id}"
}

resource "aws_security_group_rule" "allow_https_from_allow_ip_list" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = "${var.allow_ip_list}"
  security_group_id = "${aws_security_group.alb.id}"
}

resource "aws_security_group" "app" {
  name        = "app"
  description = "app"
  vpc_id      = "${module.network.aws_vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-${var.app_name}-app"
    env  = "${var.env}"
  }
}

resource "aws_security_group_rule" "allow_http_from_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.alb.id}"
  security_group_id        = "${aws_security_group.app.id}"
}
