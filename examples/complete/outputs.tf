output "ses_domain_identity_arn" {
  description = "The ARN of the domain identity"
  value       = module.ses_lambda_forwarder.ses_domain_identity_arn
}

output "ses_domain_identity_verification_arn" {
  description = "The ARN of the domain identity"
  value       = module.ses_lambda_forwarder.ses_domain_identity_verification_arn
}

output "artifact_git_ref" {
  description = "Git commit hash corresponding to the artifact"
  value       = module.ses_lambda_forwarder.artifact_git_ref
}

output "artifact_file" {
  description = "Full path to the locally downloaded artifact"
  value       = module.ses_lambda_forwarder.artifact_file
}

output "artifact_url" {
  description = "URL corresponding to the artifact"
  value       = module.ses_lambda_forwarder.artifact_url
}

output "artifact_base64sha256" {
  description = "Base64 encoded SHA256 hash of the artifact file"
  value       = module.ses_lambda_forwarder.artifact_base64sha256
}

output "lambda_iam_policy_id" {
  description = "Lamnda IAM Policy ID"
  value       = module.ses_lambda_forwarder.lambda_iam_policy_id
}

output "lambda_iam_policy_name" {
  description = "Lamnda IAM Policy name"
  value       = module.ses_lambda_forwarder.lambda_iam_policy_name
}

output "lambda_iam_policy_arn" {
  description = "Lamnda IAM Policy ARN"
  value       = module.ses_lambda_forwarder.lambda_iam_policy_arn
}

output "lambda_function_arn" {
  description = "Lamnda Function ARN"
  value       = module.ses_lambda_forwarder.lambda_function_arn
}

output "lambda_function_version" {
  description = "Latest published version of the Lambda Function"
  value       = module.ses_lambda_forwarder.lambda_function_version
}

output "lambda_function_source_code_size" {
  description = "The size in bytes of the Lambda Function .zip file"
  value       = module.ses_lambda_forwarder.lambda_function_source_code_size
}

output "s3_bucket_id" {
  description = "Lamnda IAM Policy name"
  value       = module.ses_lambda_forwarder.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "Lamnda IAM Policy ARN"
  value       = module.ses_lambda_forwarder.s3_bucket_arn
}

output "s3_bucket_domain_name" {
  description = "Lamnda IAM Policy ARN"
  value       = module.ses_lambda_forwarder.s3_bucket_domain_name
}

output "ses_receipt_rule_name" {
  description = "The name of the SES receipt rule"
  value       = module.ses_lambda_forwarder.ses_receipt_rule_name
}

output "ses_receipt_rule_set_name" {
  description = "The name of the SES receipt rule set"
  value       = module.ses_lambda_forwarder.ses_receipt_rule_set_name
}
