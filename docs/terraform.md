<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 1.2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.3 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_artifact"></a> [artifact](#module\_artifact) | cloudposse/module-artifact/external | 0.7.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.24.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_alias.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_alias) | resource |
| [aws_lambda_function.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.ses](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_route53_record.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.mx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.txt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_ses_active_receipt_rule_set.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_active_receipt_rule_set) | resource |
| [aws_ses_domain_identity.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_identity_verification.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity_verification) | resource |
| [aws_ses_receipt_rule.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_receipt_rule) | resource |
| [aws_ses_receipt_rule_set.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_receipt_rule_set) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_log_bucket_name"></a> [access\_log\_bucket\_name](#input\_access\_log\_bucket\_name) | Name of the S3 bucket where s3 access log will be sent to | `string` | `""` | no |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_artifact_filename"></a> [artifact\_filename](#input\_artifact\_filename) | Artifact filename | `string` | `"lambda.zip"` | no |
| <a name="input_artifact_url"></a> [artifact\_url](#input\_artifact\_url) | URL template for the remote artifact | `string` | `"https://artifacts.cloudposse.com/$${module_name}/$${git_ref}/$${filename}"` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Root domain name | `string` | n/a | yes |
| <a name="input_domain_validation"></a> [domain\_validation](#input\_domain\_validation) | Boolean to enable or disable Route53 zone/domain validation in module | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_forward_emails"></a> [forward\_emails](#input\_forward\_emails) | Map of forward emails | `map(list(string))` | <pre>{<br>  "ops@example.com": [<br>    "destination@example.com"<br>  ]<br>}</pre> | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_lambda_runtime"></a> [lambda\_runtime](#input\_lambda\_runtime) | Lambda runtime | `string` | `"nodejs12.x"` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region the SES should reside in | `string` | n/a | yes |
| <a name="input_relay_email"></a> [relay\_email](#input\_relay\_email) | Email that used to relay from | `string` | n/a | yes |
| <a name="input_s3_bucket_encryption_enabled"></a> [s3\_bucket\_encryption\_enabled](#input\_s3\_bucket\_encryption\_enabled) | When set to 'true' the 'aws\_s3\_bucket' resource will have AES256 encryption enabled by default | `bool` | `true` | no |
| <a name="input_spf"></a> [spf](#input\_spf) | DNS SPF record value | `string` | `"v=spf1 include:amazonses.com -all"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| <a name="input_tracing_config_mode"></a> [tracing\_config\_mode](#input\_tracing\_config\_mode) | Can be either PassThrough or Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with 'sampled=1'. If Active, Lambda will respect any tracing header it receives from an upstream service. | `string` | `"PassThrough"` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_artifact_base64sha256"></a> [artifact\_base64sha256](#output\_artifact\_base64sha256) | Base64 encoded SHA256 hash of the artifact file |
| <a name="output_artifact_file"></a> [artifact\_file](#output\_artifact\_file) | Full path to the locally downloaded artifact |
| <a name="output_artifact_git_ref"></a> [artifact\_git\_ref](#output\_artifact\_git\_ref) | Git commit hash corresponding to the artifact |
| <a name="output_artifact_url"></a> [artifact\_url](#output\_artifact\_url) | URL corresponding to the artifact |
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | Lamnda Function ARN |
| <a name="output_lambda_function_source_code_size"></a> [lambda\_function\_source\_code\_size](#output\_lambda\_function\_source\_code\_size) | The size in bytes of the Lambda Function .zip file |
| <a name="output_lambda_function_version"></a> [lambda\_function\_version](#output\_lambda\_function\_version) | Latest published version of the Lambda Function |
| <a name="output_lambda_iam_policy_arn"></a> [lambda\_iam\_policy\_arn](#output\_lambda\_iam\_policy\_arn) | Lamnda IAM Policy ARN |
| <a name="output_lambda_iam_policy_id"></a> [lambda\_iam\_policy\_id](#output\_lambda\_iam\_policy\_id) | Lamnda IAM Policy ID |
| <a name="output_lambda_iam_policy_name"></a> [lambda\_iam\_policy\_name](#output\_lambda\_iam\_policy\_name) | Lamnda IAM Policy name |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | Lamnda IAM Policy ARN |
| <a name="output_s3_bucket_domain_name"></a> [s3\_bucket\_domain\_name](#output\_s3\_bucket\_domain\_name) | Lamnda IAM Policy ARN |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | Lamnda IAM Policy name |
| <a name="output_ses_domain_identity_arn"></a> [ses\_domain\_identity\_arn](#output\_ses\_domain\_identity\_arn) | The ARN of the domain identity |
| <a name="output_ses_domain_identity_verification_arn"></a> [ses\_domain\_identity\_verification\_arn](#output\_ses\_domain\_identity\_verification\_arn) | The ARN of the domain identity |
| <a name="output_ses_receipt_rule_name"></a> [ses\_receipt\_rule\_name](#output\_ses\_receipt\_rule\_name) | The name of the SES receipt rule |
| <a name="output_ses_receipt_rule_set_name"></a> [ses\_receipt\_rule\_set\_name](#output\_ses\_receipt\_rule\_set\_name) | The name of the SES receipt rule set |
<!-- markdownlint-restore -->
