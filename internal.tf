resource "aws_instance" "internal" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.medium"
  subnet_id       = "${aws_subnet.private.id}"
  key_name        = "${aws_key_pair.internal.key_name}"
  security_groups = ["${aws_security_group.internal.id}"]

  tags {
    Name = "internal"
  }
}
