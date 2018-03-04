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
    Name = "bastion"
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
    Name = "internal"
  }
}
