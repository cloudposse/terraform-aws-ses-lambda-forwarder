
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| domain | Root domain name | string | - | yes |
| forward_emails | Emails forward map | map | `<map>` | no |
| name | Application or solution name (e.g. `app`) | string | `ses` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| region | AWS Region the SES should reside in | string | `us-west-2` | no |
| relay_email | Email that used to relay from | string | - | yes |
| spf | DNS SPF record value | string | `v=spf1 include:amazonses.com -all` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |

