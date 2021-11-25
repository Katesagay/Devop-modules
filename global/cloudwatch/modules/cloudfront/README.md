## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.cloudfront_400](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cloudfront_500](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_enabled"></a> [actions\_enabled](#input\_actions\_enabled) | enable actions | `bool` | `true` | no |
| <a name="input_alarms"></a> [alarms](#input\_alarms) | n/a | `map(any)` | `{}` | no |
| <a name="input_arn"></a> [arn](#input\_arn) | n/a | `any` | n/a | yes |
| <a name="input_distribution_id"></a> [distribution\_id](#input\_distribution\_id) | distribution\_id | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | domain name | `string` | `""` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | Period to look back | `number` | `1` | no |
| <a name="input_evaluation_periods_400"></a> [evaluation\_periods\_400](#input\_evaluation\_periods\_400) | evaluation period | `number` | `1` | no |
| <a name="input_evaluation_periods_500"></a> [evaluation\_periods\_500](#input\_evaluation\_periods\_500) | evaluation period | `number` | `1` | no |
| <a name="input_period"></a> [period](#input\_period) | Period to look back | `string` | `""` | no |
| <a name="input_threshold_400"></a> [threshold\_400](#input\_threshold\_400) | Threshold to trigger action | `number` | `1` | no |
| <a name="input_threshold_500"></a> [threshold\_500](#input\_threshold\_500) | Threshold to trigger action | `number` | `1` | no |

## Outputs

No outputs.
