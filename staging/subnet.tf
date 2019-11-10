variable "cidr_blocks" {
  type = "map"

  default = {
    private_1c = "10.1.0.0/26"
    private_1d = "10.1.0.64/26"
    public_1c  = "10.1.1.0/26"
    public_1d  = "10.1.1.64/26"
  }
}

resource "aws_subnet" "public_1d" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "public_1d")}"
  availability_zone = "ap-northeast-1d"

  tags {
    Name        = "${var.short_env}-${var.app_name}-public-1d"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "private_1d")}"
  availability_zone = "ap-northeast-1d"

  tags {
    Name        = "${var.short_env}-${var.app_name}-private-1d"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "public_1c")}"
  availability_zone = "ap-northeast-1c"

  tags {
    Name        = "${var.short_env}-${var.app_name}-public-1c"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.cidr_blocks, "private_1c")}"
  availability_zone = "ap-northeast-1c"

  tags {
    Name        = "${var.short_env}-${var.app_name}-private-1c"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
