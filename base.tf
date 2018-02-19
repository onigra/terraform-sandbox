provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "ap-northeast-1"
  profile                 = "terraform-${var.environment}"
}

variable "environment" {}

variable "app_name" {
  default = "rails-sandbox"
}
