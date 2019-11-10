terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket = "onigra-terraform-sandbox-state"
    key    = "stg/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  version = ">= 2.0"
  region  = "ap-northeast-1"
  profile = "default"
}

variable "env" {
  default = "stg"
}

variable "app_name" {
  default = "test"
}

# Use Environment Varialbe
variable "allow_ip_list" {
  type = "list"
}
