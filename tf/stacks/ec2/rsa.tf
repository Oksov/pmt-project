module "rsa" {
  source   = "../../modules/rsa"
  key_name = "${var.environment}-development-rsa"
}