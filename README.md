## Requirements

Hello welcome to My

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alert_distribution_alarm"></a> [alert\_distribution\_alarm](#module\_alert\_distribution\_alarm) | ./global/cloudwatch/modules/alert_distribution/ | n/a |
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | ./modules/cloudfront/ | n/a |
| <a name="module_cloudfront_alarm"></a> [cloudfront\_alarm](#module\_cloudfront\_alarm) | ./global/cloudwatch/modules/cloudfront/ | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ./modules/route53/ | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/s3/ | n/a |
| <a name="module_s3_alarm"></a> [s3\_alarm](#module\_s3\_alarm) | ./global/cloudwatch/modules/s3/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_S3_actions_enabled"></a> [S3\_actions\_enabled](#input\_S3\_actions\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | n/a | `any` | n/a | yes |
| <a name="input_cloudfront_actions_enabled"></a> [cloudfront\_actions\_enabled](#input\_cloudfront\_actions\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_distribution_id"></a> [distribution\_id](#input\_distribution\_id) | n/a | `any` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `any` | n/a | yes |
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | n/a | `any` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `any` | n/a | yes |
| <a name="input_sns"></a> [sns](#input\_sns) | n/a | `any` | n/a | yes |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_website"></a> [website](#output\_website) | n/a |
