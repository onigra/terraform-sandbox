resource "aws_vpc" "vpc" {
  cidr_block         = "10.0.0.0/16"
  enable_dns_support = true

  tags {
    Name        = "${var.short_env}-${var.app_name}"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.short_env}-${var.app_name}"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
