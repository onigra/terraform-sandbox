variable "cidr_blocks" {
  type = "map"

  default = {
    private_1c = "10.1.0.0/26"
    private_1d = "10.1.0.64/26"
    public_1c  = "10.1.1.0/26"
    public_1d  = "10.1.1.64/26"
  }
}

module "network" {
  source      = "../modules/network"
  env         = "${var.env}"
  vpc_cidr    = "10.1.0.0/16"
  cidr_blocks = "${var.cidr_blocks}"
  app_name    = "${var.app_name}"
}
