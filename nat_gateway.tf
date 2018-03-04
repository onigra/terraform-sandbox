resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat_gateway.id}"
  subnet_id     = "${aws_subnet.public.id}"

  tags {
    App         = "${var.app_name}"
    Environment = "${var.environment}"
  }
}
