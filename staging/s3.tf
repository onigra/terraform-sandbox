resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.app_name}-terraform-state"
  acl    = "private"

  tags {
    Name = "${var.app_name}-terraform-state"
  }
}

resource "aws_s3_bucket" "assets" {
  bucket = "${var.short_env}-${var.app_name}-static"
  acl    = "private"

  tags {
    Name        = "${var.short_env}-${var.app_name}-static"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}

resource "aws_s3_bucket" "log" {
  bucket = "${var.short_env}-${var.app_name}-log"
  acl    = "private"

  tags {
    Name        = "${var.short_env}-${var.app_name}-log"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
