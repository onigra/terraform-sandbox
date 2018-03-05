resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "bastion"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.bastion_allow_ip_list}"
  }

  tags {
    Name        = "${var.short_env}-${var.app_name}-bastion"
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

  tags {
    Name        = "${var.short_env}-${var.app_name}-internal"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
