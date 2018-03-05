resource "aws_eip" "nat_gateway_1d" {
  vpc = true

  tags {
    Name        = "${var.short_env}-${var.app_name}-nat-gateway-1d"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
