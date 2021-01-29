variable "relay_email" {
  type        = string
  description = "Email that used to relay from"
}

variable "forward_emails" {
  type = map(list(string))

  default = {
    "ops@example.com" = ["destination@example.com"]
  }

  description = "Map of forward emails"
}

variable "domain" {
  type        = string
  description = "Root domain name"
}

variable "region" {
  type        = string
  description = "AWS Region the SES should reside in"
}

variable "spf" {
  type        = string
  default     = "v=spf1 include:amazonses.com -all"
  description = "DNS SPF record value"
}

variable "lambda_runtime" {
  type        = string
  description = "Lambda runtime"
  default     = "nodejs12.x"
}

variable "artifact_url" {
  type        = string
  description = "URL template for the remote artifact"
  default     = "https://artifacts.cloudposse.com/$$${module_name}/$$${git_ref}/$$${filename}"
}

variable "artifact_filename" {
  type        = string
  description = "Artifact filename"
  default     = "lambda.zip"
}

variable "versioning_enabled" {
  type        = bool
  default     = true
  description = "A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket"
}

variable "tracing_config_mode" {
  type        = string
  description = "Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with 'sampled=1'. If Active, Lambda will respect any tracing header it receives from an upstream service."
  default     = "PassThrough"
}

variable "access_log_bucket_name" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket where s3 access log will be sent to"
}

variable "s3_bucket_encryption_enabled" {
  type        = bool
  default     = true
  description = "When set to 'true' the 'aws_s3_bucket' resource will have AES256 encryption enabled by default"
}
