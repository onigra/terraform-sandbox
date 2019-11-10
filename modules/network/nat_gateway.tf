resource "aws_nat_gateway" "nat_1c" {
  allocation_id = "${aws_eip.nat_gateway_1c.id}"
  subnet_id     = "${aws_subnet.public_1c.id}"

  tags = {
    Name = "${var.env}-${var.app_name}-1c"
    env  = "${var.env}"
  }
}

resource "aws_eip" "nat_gateway_1c" {
  vpc = true

  tags = {
    Name = "${var.env}-${var.app_name}-nat-gateway-1c"
    env  = "${var.env}"
  }
}


resource "aws_nat_gateway" "nat_1d" {
  allocation_id = "${aws_eip.nat_gateway_1d.id}"
  subnet_id     = "${aws_subnet.public_1d.id}"

  tags = {
    Name = "${var.env}-${var.app_name}-1d"
    env  = "${var.env}"
  }
}

resource "aws_eip" "nat_gateway_1d" {
  vpc = true

  tags = {
    Name = "${var.env}-${var.app_name}-nat-gateway-1d"
    env  = "${var.env}"
  }
}
