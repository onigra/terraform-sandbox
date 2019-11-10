data "aws_ami" "ubuntu_1804" {
  most_recent = true
  owners      = ["099720109477"] # UbuntuイメージのOwner

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20180522"]
  }
}
