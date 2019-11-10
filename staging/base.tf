terraform {
  backend "s3" {
    bucket = "terraform-sandbox-tfstate"
    key    = "staging/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "ap-northeast-1"
  profile                 = "terraform-${var.environment}"
}

variable "environment" {
  default = "staging"
}

variable "short_env" {
  default = "stg"
}

# Use Environment Varialbe
variable "bastion_allow_ip_list" {
  type = "list"
}

variable "app_name" {
  default = "rails-sandbox"
}
