resource "aws_vpc" "vpc" {
  cidr_block         = "${var.vpc_cidr}"
  enable_dns_support = true

  tags = {
    Name = "${var.env}-${var.app_name}"
    env  = "${var.env}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.env}-${var.app_name}"
    env  = "${var.env}"
  }
}

output "aws_vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
