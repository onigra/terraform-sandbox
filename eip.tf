resource "aws_eip" "nat_gateway" {
  vpc = true
}
