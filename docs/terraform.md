## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.0 |
| external | ~> 1.2 |
| local | ~> 1.3 |
| template | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| artifact\_filename | Artifact filename | `string` | `"lambda.zip"` | no |
| artifact\_url | URL template for the remote artifact | `string` | `"https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}"` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| domain | Root domain name | `string` | n/a | yes |
| forward\_emails | Map of forward emails | `map(list(string))` | <pre>{<br>  "ops@example.com": [<br>    "destination@example.com"<br>  ]<br>}</pre> | no |
| lambda\_runtime | Lambda runtime | `string` | `"nodejs8.10"` | no |
| name | Application or solution name (e.g. `app`) | `string` | `"ses"` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | `string` | `""` | no |
| region | AWS Region the SES should reside in | `string` | n/a | yes |
| relay\_email | Email that used to relay from | `string` | n/a | yes |
| spf | DNS SPF record value | `string` | `"v=spf1 include:amazonses.com -all"` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | `string` | `""` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| artifact\_base64sha256 | Base64 encoded SHA256 hash of the artifact file |
| artifact\_file | Full path to the locally downloaded artifact |
| artifact\_git\_ref | Git commit hash corresponding to the artifact |
| artifact\_url | URL corresponding to the artifact |
| lambda\_function\_arn | Lamnda Function ARN |
| lambda\_function\_source\_code\_size | The size in bytes of the Lambda Function .zip file |
| lambda\_function\_version | Latest published version of the Lambda Function |
| lambda\_iam\_policy\_arn | Lamnda IAM Policy ARN |
| lambda\_iam\_policy\_id | Lamnda IAM Policy ID |
| lambda\_iam\_policy\_name | Lamnda IAM Policy name |
| s3\_bucket\_arn | Lamnda IAM Policy ARN |
| s3\_bucket\_domain\_name | Lamnda IAM Policy ARN |
| s3\_bucket\_id | Lamnda IAM Policy name |
| ses\_domain\_identity\_arn | The ARN of the domain identity |
| ses\_domain\_identity\_verification\_arn | The ARN of the domain identity |
| ses\_receipt\_rule\_name | The name of the SES receipt rule |
| ses\_receipt\_rule\_set\_name | The name of the SES receipt rule set |

