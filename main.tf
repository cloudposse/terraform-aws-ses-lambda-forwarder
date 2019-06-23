data "aws_caller_identity" "current" {
}

module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.13.0"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

