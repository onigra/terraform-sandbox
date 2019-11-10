resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-sandbox-tfstate"
  acl    = "private"

  tags {
    Name = "terraform-sandbox-tfstate"
  }
}
