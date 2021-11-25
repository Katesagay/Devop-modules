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
| [aws_sns_topic.cloudwatch-alarm-topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.sns-topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_iam_policy_document.sns-topic-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | `""` | no |
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | Email address of respondent | `string` | `""` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Type of protocol | `string` | `"email"` | no |
| <a name="input_sns"></a> [sns](#input\_sns) | Name of sns topic | `map(string)` | `{}` | no |
| <a name="input_sns_name"></a> [sns\_name](#input\_sns\_name) | n/a | `any` | n/a | yes |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | Threshold to trigger action | `number` | `1` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch-alarm-topic"></a> [cloudwatch-alarm-topic](#output\_cloudwatch-alarm-topic) | n/a |
