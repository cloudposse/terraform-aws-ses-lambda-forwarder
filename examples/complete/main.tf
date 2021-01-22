provider "aws" {
  region = var.region
}

module "ses_lambda_forwarder" {
  source = "../../"

  region = var.region
  domain = var.domain

  relay_email    = var.relay_email
  forward_emails = var.forward_emails

  lambda_runtime = var.lambda_runtime
  spf            = var.spf

  artifact_url      = var.artifact_url
  artifact_filename = var.artifact_filename
  mfa_delete        = var.mfa_delete

  context = module.this.context
}
