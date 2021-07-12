# Locals configuration to check if we should create SES validation or not (allow external management of this)
locals {
  enable_ses_validation = var.domain_validation ? 1 : 0
}

data "aws_route53_zone" "default" {
  name = var.domain
}

resource "aws_route53_record" "default" {
  count   = local.enable_ses_validation
  zone_id = data.aws_route53_zone.default.zone_id
  name    = "_amazonses.${aws_ses_domain_identity.default.0.id}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.default.0.verification_token]
}

# Add Route53 MX record
resource "aws_route53_record" "mx" {
  count   = local.enable_ses_validation
  zone_id = data.aws_route53_zone.default.zone_id
  name    = aws_ses_domain_identity.default.0.id
  type    = "MX"
  ttl     = "600"
  records = ["10 inbound-smtp.${var.region}.amazonaws.com"]
  # Change to the region in which `aws_ses_domain_identity.default` is created
}

# Add Route53 TXT record for SPF
resource "aws_route53_record" "txt" {
  count   = local.enable_ses_validation
  zone_id = data.aws_route53_zone.default.zone_id
  name    = aws_ses_domain_identity.default.0.id
  type    = "TXT"
  ttl     = "600"
  records = [var.spf]
}

resource "aws_ses_domain_identity" "default" {
  count  = local.enable_ses_validation
  domain = var.domain
}

resource "aws_ses_domain_identity_verification" "default" {
  count  = local.enable_ses_validation
  domain = aws_ses_domain_identity.default.0.id

  depends_on = [aws_route53_record.default]
}
