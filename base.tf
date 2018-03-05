provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "ap-northeast-1"
  profile                 = "terraform-${var.environment}"
}

variable "environment" {}
variable "short_env" {}
variable "bastion_pubkey" {}
variable "internal_pubkey" {}
variable "deploy_pubkey" {}

# Use Environment Varialbe
variable "bastion_allow_ip_list" {
  type = "list"
}

variable "app_name" {
  default = "rails-sandbox"
}
