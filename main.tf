data "aws_caller_identity" "current" {
}

module "label" {
  source     = "git::https://github.com/rverma-nikiai/terraform-null-label.git?ref=master"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

