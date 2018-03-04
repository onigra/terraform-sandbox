provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "ap-northeast-1"
  profile                 = "terraform-${var.environment}"
}

variable "environment" {}

# Use Environment Varialbe
variable "bastion_allow_ip_list" {
  type = "list"
}

variable "app_name" {
  default = "rails-sandbox"
}
