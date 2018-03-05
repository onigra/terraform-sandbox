resource "aws_subnet" "public_1d" {
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

resource "aws_subnet" "private_1d" {
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

resource "aws_subnet" "public_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"

  tags {
    Name        = "${var.short_env}-${var.app_name}-public-1c"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
    Access      = "public"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1c"

  tags {
    Name        = "${var.short_env}-${var.app_name}-private-1c"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
    Access      = "private"
  }
}
