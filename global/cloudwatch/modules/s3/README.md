## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.s3_numberofbytes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | Enable actions | `bool` | `true` | no |
| <a name="input_arn"></a> [arn](#input\_arn) | n/a | `any` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | S3 bucket name and domain name | `string` | `""` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | Number of periods to look back | `number` | `1` | no |
| <a name="input_period"></a> [period](#input\_period) | Period to look back | `number` | `60` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type | `string` | `"AllStorageTypes"` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | Threshold to trigger action | `number` | `1` | no |

## Outputs

No outputs.
