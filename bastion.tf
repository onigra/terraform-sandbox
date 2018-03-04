data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20180126"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.public.id}"
  key_name                    = "${aws_key_pair.bastion.key_name}"
  associate_public_ip_address = true
  security_groups             = ["${aws_security_group.bastion.id}"]

  tags {
    Name = "bastion"
  }
}
