resource "aws_key_pair" "bastion" {
  key_name   = "${var.short_env}-${var.app_name}--bastion"
  public_key = "${var.bastion_pubkey}"
}

resource "aws_key_pair" "internal" {
  key_name   = "${var.short_env}-${var.app_name}-internal"
  public_key = "${var.internal_pubkey}"
}

resource "aws_key_pair" "deploy" {
  key_name   = "${var.short_env}-${var.app_name}-deploy"
  public_key = "${var.deploy_pubkey}"
}
