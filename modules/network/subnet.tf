resource "aws_subnet" "public_1d" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "public_1d")}"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "${var.env}-${var.app_name}-public-1d"
    env  = "${var.env}"
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "private_1d")}"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "${var.env}-${var.app_name}-private-1d"
    env  = "${var.env}"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "public_1c")}"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.env}-${var.app_name}-public-1c"
    env  = "${var.env}"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "private_1c")}"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.env}-${var.app_name}-private-1c"
    env  = "${var.env}"
  }
}

output "public_1d" {
  value = "${aws_subnet.public_1d.id}"
}

output "private_1d" {
  value = "${aws_subnet.private_1d.id}"
}

output "public_1c" {
  value = "${aws_subnet.public_1c.id}"
}


output "private_1c" {
  value = "${aws_subnet.private_1c.id}"
}
