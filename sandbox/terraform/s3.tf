data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "sandbox_bucket" {
  bucket = "aft-sandbox-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
}

resource "control_tower_account_factory_customization" "account_customization" {
  type   = "account"
  source = "aws-ia/control_tower_s3_logging/aws"
  version = "0.1.0"

  parameters = {
    account_id = "818987027252"
  }
}