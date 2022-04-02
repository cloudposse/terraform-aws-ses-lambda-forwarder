resource "aws_s3_bucket" "default" {
  #bridgecrew:skip=BC_AWS_S3_13:Skipping `Enable S3 Bucket Logging` check until bridgecrew will support dynamic blocks (https://github.com/bridgecrewio/checkov/issues/776).
  #bridgecrew:skip=BC_AWS_S3_14:Skipping `Ensure all data stored in the S3 bucket is securely encrypted at rest` check until bridgecrew will support dynamic blocks (https://github.com/bridgecrewio/checkov/issues/776).
  #bridgecrew:skip=CKV_AWS_52:Skipping `Ensure S3 bucket has MFA delete enabled` due to issue in terraform (https://github.com/hashicorp/terraform-provider-aws/issues/629).
  bucket        = module.this.id
  force_destroy = true
  tags          = module.this.tags
}

resource "aws_s3_bucket_versioning" "default" {
  bucket = aws_s3_bucket.default.id
  count  = var.versioning_enabled ? 1 : 0
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "default" {
  bucket        = aws_s3_bucket.default.id
  count         = var.access_log_bucket_name != "" ? 1 : 0
  target_bucket = var.access_log_bucket_name
  target_prefix = "logs/${module.this.id}/"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.default.id
  count  = var.s3_bucket_encryption_enabled ? 1 : 0

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


data "aws_iam_policy_document" "s3" {
  statement {
    sid = "GiveSESPermissionToWriteEmail"

    effect = "Allow"

    principals {
      identifiers = ["ses.amazonaws.com"]
      type        = "Service"
    }

    actions = ["s3:PutObject"]

    resources = ["${aws_s3_bucket.default.arn}/*"]

    condition {
      test     = "StringEquals"
      values   = [data.aws_caller_identity.current.account_id]
      variable = "aws:Referer"
    }
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.default.id
  policy = data.aws_iam_policy_document.s3.json
}
