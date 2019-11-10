resource "aws_security_group" "alb" {
  name        = "${var.short_env}-${var.app_name}-alb"
  description = "${var.short_env}-${var.app_name}-alb"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "${var.bastion_allow_ip_list}"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "${var.bastion_allow_ip_list}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.short_env}-${var.app_name}-alb"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}

resource "aws_security_group" "internal" {
  name        = "internal"
  description = "internal"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.bastion.id}"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.alb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.short_env}-${var.app_name}-internal"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
