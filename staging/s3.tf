resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.app_name}-terraform-state"
  acl    = "private"

  tags {
    Name = "${var.app_name}-terraform-state"
  }
}
