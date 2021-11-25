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
| [aws_s3_bucket.devout](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.devout](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_policy.devout](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | n/a | `string` | `"public-read"` | no |
| <a name="input_bucket_versioning_enabled"></a> [bucket\_versioning\_enabled](#input\_bucket\_versioning\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | n/a | `string` | `"text/html"` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | n/a | <pre>object({<br>    allowed_headers = any<br>    allowed_methods = any<br>    expose_headers  = any<br>    max_age_seconds = any<br>  })</pre> | <pre>{<br>  "allowed_headers": [<br>    "*"<br>  ],<br>  "allowed_methods": [<br>    "PUT",<br>    "POST"<br>  ],<br>  "expose_headers": [<br>    "ETag"<br>  ],<br>  "max_age_seconds": "3000"<br>}</pre> | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `string` | `""` | no |
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | n/a | `string` | `"404.html"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `bool` | `true` | no |
| <a name="input_html_directory"></a> [html\_directory](#input\_html\_directory) | n/a | `string` | `"././devoutS3Files/"` | no |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | n/a | `string` | `"index.html"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_s3_bucket_name"></a> [aws\_s3\_bucket\_name](#output\_aws\_s3\_bucket\_name) | n/a |
| <a name="output_website"></a> [website](#output\_website) | n/a |
