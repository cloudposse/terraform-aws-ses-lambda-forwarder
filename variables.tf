variable "namespace" {
  type        = string
  description = "Namespace (e.g. `cp` or `cloudposse`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Application or solution name (e.g. `app`)"
  default     = "ses"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

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
  default     = "nodejs8.10"
}
