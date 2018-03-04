resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.0.0/24"

  tags {
    App         = "${var.app_name}"
    Environment = "${var.environment}"
    Access      = "public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    App         = "${var.app_name}"
    Environment = "${var.environment}"
    Access      = "private"
  }
}
