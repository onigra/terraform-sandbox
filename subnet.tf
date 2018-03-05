resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1d"

  tags {
    Name        = "${var.short_env}-${var.app_name}-public-1d"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
    Access      = "public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1d"

  tags {
    Name        = "${var.short_env}-${var.app_name}-private-1d"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
    Access      = "private"
  }
}
