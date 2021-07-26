output "ses_domain_identity_arn" {
  description = "The ARN of the domain identity"
  value       = join("", aws_ses_domain_identity.default.*.arn)
}

output "ses_domain_identity_verification_arn" {
  description = "The ARN of the domain identity"
  value       = join("", aws_ses_domain_identity_verification.default.*.arn)
}

output "artifact_git_ref" {
  description = "Git commit hash corresponding to the artifact"
  value       = module.artifact.git_ref
}

output "artifact_file" {
  description = "Full path to the locally downloaded artifact"
  value       = module.artifact.file
}

output "artifact_url" {
  description = "URL corresponding to the artifact"
  value       = module.artifact.url
}

output "artifact_base64sha256" {
  description = "Base64 encoded SHA256 hash of the artifact file"
  value       = module.artifact.base64sha256
}

output "lambda_iam_policy_id" {
  description = "Lamnda IAM Policy ID"
  value       = aws_iam_policy.lambda.id
}

output "lambda_iam_policy_name" {
  description = "Lamnda IAM Policy name"
  value       = aws_iam_policy.lambda.name
}

output "lambda_iam_policy_arn" {
  description = "Lamnda IAM Policy ARN"
  value       = aws_iam_policy.lambda.arn
}

output "lambda_function_arn" {
  description = "Lamnda Function ARN"
  value       = aws_lambda_function.default.arn
}

output "lambda_function_version" {
  description = "Latest published version of the Lambda Function"
  value       = aws_lambda_function.default.version
}

output "lambda_function_source_code_size" {
  description = "The size in bytes of the Lambda Function .zip file"
  value       = aws_lambda_function.default.source_code_size
}

output "s3_bucket_id" {
  description = "Lamnda IAM Policy name"
  value       = aws_s3_bucket.default.id
}

output "s3_bucket_arn" {
  description = "Lamnda IAM Policy ARN"
  value       = aws_s3_bucket.default.arn
}

output "s3_bucket_domain_name" {
  description = "Lamnda IAM Policy ARN"
  value       = aws_s3_bucket.default.bucket_domain_name
}

output "ses_receipt_rule_name" {
  description = "The name of the SES receipt rule"
  value       = aws_ses_receipt_rule.default.name
}

output "ses_receipt_rule_set_name" {
  description = "The name of the SES receipt rule set"
  value       = aws_ses_receipt_rule.default.rule_set_name
}
