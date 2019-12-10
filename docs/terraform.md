## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| domain | Root domain name | string | - | yes |
| forward_emails | Map of forward emails | map(list(string)) | `<map>` | no |
| lambda_runtime | Lambda runtime | string | `nodejs8.10` | no |
| name | Application or solution name (e.g. `app`) | string | `ses` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | `` | no |
| region | AWS Region the SES should reside in | string | - | yes |
| relay_email | Email that used to relay from | string | - | yes |
| spf | DNS SPF record value | string | `v=spf1 include:amazonses.com -all` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | `` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| artifact_base64sha256 | Base64 encoded SHA256 hash of the artifact file |
| artifact_file | Full path to the locally downloaded artifact |
| artifact_git_ref | Git commit hash corresponding to the artifact |
| artifact_url | URL corresponding to the artifact |
| lambda_function_arn | Lamnda Function ARN |
| lambda_function_source_code_size | The size in bytes of the Lambda Function .zip file |
| lambda_function_version | Latest published version of the Lambda Function |
| lambda_iam_policy_arn | Lamnda IAM Policy ARN |
| lambda_iam_policy_id | Lamnda IAM Policy ID |
| lambda_iam_policy_name | Lamnda IAM Policy name |
| s3_bucket_arn | Lamnda IAM Policy ARN |
| s3_bucket_domain_name | Lamnda IAM Policy ARN |
| s3_bucket_id | Lamnda IAM Policy name |
| ses_domain_identity_arn | The ARN of the domain identity |
| ses_domain_identity_verification_arn | The ARN of the domain identity |
| ses_receipt_rule_name | The name of the SES receipt rule |
| ses_receipt_rule_set_name | The name of the SES receipt rule set |

