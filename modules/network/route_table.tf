resource "aws_route_table" "private_1c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_1c.id}"
  }

  tags = {
    Name    = "${var.env}-${var.app_name}-private-1c"
    env     = "${var.env}"
    default = "false"
  }
}

resource "aws_route_table_association" "private_1c" {
  subnet_id      = "${aws_subnet.private_1c.id}"
  route_table_id = "${aws_route_table.private_1c.id}"
}

resource "aws_route_table" "private_1d" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_1d.id}"
  }

  tags = {
    Name    = "${var.env}-${var.app_name}-private-1d"
    env     = "${var.env}"
    default = "false"
  }
}

resource "aws_route_table_association" "private_1d" {
  subnet_id      = "${aws_subnet.private_1d.id}"
  route_table_id = "${aws_route_table.private_1d.id}"
}


resource "aws_default_route_table" "public" {
  default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name    = "${var.env}-${var.app_name}-public"
    env     = "${var.env}"
    default = "true"
  }
}

resource "aws_route_table_association" "public_1d" {
  subnet_id      = "${aws_subnet.public_1d.id}"
  route_table_id = "${aws_default_route_table.public.id}"
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = "${aws_subnet.public_1c.id}"
  route_table_id = "${aws_default_route_table.public.id}"
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.vpc.id}"
  route_table_id = "${aws_default_route_table.public.id}"
}
