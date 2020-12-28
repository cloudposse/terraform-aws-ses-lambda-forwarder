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
