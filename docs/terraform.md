<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 2.0 |
| external | >= 1.2 |
| local | >= 1.3 |
| template | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| artifact | cloudposse/module-artifact/external | 0.7.0 |
| this | cloudposse/label/null | 0.24.1 |

## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/data-sources/caller_identity) |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/iam_policy) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/iam_role) |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/iam_role_policy_attachment) |
| [aws_lambda_alias](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/lambda_alias) |
| [aws_lambda_function](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/lambda_function) |
| [aws_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/lambda_permission) |
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/route53_record) |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/data-sources/route53_zone) |
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/s3_bucket) |
| [aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/s3_bucket_policy) |
| [aws_ses_active_receipt_rule_set](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/ses_active_receipt_rule_set) |
| [aws_ses_domain_identity](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/ses_domain_identity) |
| [aws_ses_domain_identity_verification](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/ses_domain_identity_verification) |
| [aws_ses_receipt_rule](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/ses_receipt_rule) |
| [aws_ses_receipt_rule_set](https://registry.terraform.io/providers/hashicorp/aws/2.0/docs/resources/ses_receipt_rule_set) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_log\_bucket\_name | Name of the S3 bucket where s3 access log will be sent to | `string` | `""` | no |
| additional\_tag\_map | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| artifact\_filename | Artifact filename | `string` | `"lambda.zip"` | no |
| artifact\_url | URL template for the remote artifact | `string` | `"https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}"` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| context | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| domain | Root domain name | `string` | n/a | yes |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| environment | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| forward\_emails | Map of forward emails | `map(list(string))` | <pre>{<br>  "ops@example.com": [<br>    "destination@example.com"<br>  ]<br>}</pre> | no |
| id\_length\_limit | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| label\_key\_case | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| label\_value\_case | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| lambda\_runtime | Lambda runtime | `string` | `"nodejs12.x"` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| region | AWS Region the SES should reside in | `string` | n/a | yes |
| relay\_email | Email that used to relay from | `string` | n/a | yes |
| s3\_bucket\_encryption\_enabled | When set to 'true' the 'aws\_s3\_bucket' resource will have AES256 encryption enabled by default | `bool` | `true` | no |
| spf | DNS SPF record value | `string` | `"v=spf1 include:amazonses.com -all"` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| tracing\_config\_mode | Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with 'sampled=1'. If Active, Lambda will respect any tracing header it receives from an upstream service. | `string` | `"PassThrough"` | no |
| versioning\_enabled | A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket | `bool` | `true` | no |

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
<!-- markdownlint-restore -->
