resource "aws_nat_gateway" "1d" {
  allocation_id = "${aws_eip.nat_gateway_1d.id}"
  subnet_id     = "${aws_subnet.public_1d.id}"

  tags {
    Name        = "${var.short_env}-${var.app_name}-1d"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
