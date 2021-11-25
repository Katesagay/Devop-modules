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
| [aws_cloudfront_distribution.devout](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.devout](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_distribution) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_methods"></a> [allowed\_methods](#input\_allowed\_methods) | n/a | `map(list(string))` | <pre>{<br>  "default_cache_behavior": [<br>    "DELETE",<br>    "GET",<br>    "HEAD",<br>    "OPTIONS",<br>    "PATCH",<br>    "POST",<br>    "PUT"<br>  ],<br>  "ordered_cache_behavior_precedence_0": [<br>    "GET",<br>    "HEAD",<br>    "OPTIONS"<br>  ],<br>  "ordered_cache_behavior_precedence_1": [<br>    "GET",<br>    "HEAD",<br>    "OPTIONS"<br>  ]<br>}</pre> | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `any` | n/a | yes |
| <a name="input_cached_methods"></a> [cached\_methods](#input\_cached\_methods) | n/a | `map(list(string))` | <pre>{<br>  "default_cache_behavior": [<br>    "GET",<br>    "HEAD"<br>  ],<br>  "ordered_cache_behavior_precedence_0": [<br>    "GET",<br>    "HEAD",<br>    "OPTIONS"<br>  ],<br>  "ordered_cache_behavior_precedence_1": [<br>    "GET",<br>    "HEAD"<br>  ]<br>}</pre> | no |
| <a name="input_cloudfront_default_certificate"></a> [cloudfront\_default\_certificate](#input\_cloudfront\_default\_certificate) | n/a | `bool` | `true` | no |
| <a name="input_cloudfront_distribution"></a> [cloudfront\_distribution](#input\_cloudfront\_distribution) | n/a | `string` | `""` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | n/a | `string` | `"managed by terraform"` | no |
| <a name="input_compress"></a> [compress](#input\_compress) | n/a | `map(string)` | <pre>{<br>  "ordered_cache_behavior_precedence_0": true,<br>  "ordered_cache_behavior_precedence_1": true<br>}</pre> | no |
| <a name="input_cookies_forward"></a> [cookies\_forward](#input\_cookies\_forward) | n/a | `map(string)` | <pre>{<br>  "default_cache_behavior": "none",<br>  "ordered_cache_behavior_precedence_0": "none",<br>  "ordered_cache_behavior_precedence_1": "none"<br>}</pre> | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | n/a | `string` | `"index.html"` | no |
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | n/a | `list(any)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_evaluate_target_health"></a> [evaluate\_target\_health](#input\_evaluate\_target\_health) | n/a | `bool` | `false` | no |
| <a name="input_headers"></a> [headers](#input\_headers) | n/a | `list(any)` | <pre>[<br>  "Origin"<br>]</pre> | no |
| <a name="input_include_cookies"></a> [include\_cookies](#input\_include\_cookies) | n/a | `bool` | `false` | no |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | n/a | `list(string)` | `null` | no |
| <a name="input_origin_domain_name"></a> [origin\_domain\_name](#input\_origin\_domain\_name) | n/a | `any` | n/a | yes |
| <a name="input_path_pattern"></a> [path\_pattern](#input\_path\_pattern) | n/a | `map(string)` | <pre>{<br>  "ordered_cache_behavior_precedence_0": "/content/immutable/*",<br>  "ordered_cache_behavior_precedence_1": "/content/*"<br>}</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `"logs/"` | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | n/a | `map(string)` | <pre>{<br>  "default": "PriceClass_100",<br>  "dev": "PriceClass_200",<br>  "prod": "PriceClass_All"<br>}</pre> | no |
| <a name="input_query_string"></a> [query\_string](#input\_query\_string) | n/a | `map(string)` | <pre>{<br>  "default_cache_behavior": false,<br>  "ordered_cache_behavior_precedence_0": false,<br>  "ordered_cache_behavior_precedence_1": false<br>}</pre> | no |
| <a name="input_restriction_type"></a> [restriction\_type](#input\_restriction\_type) | n/a | `string` | `"none"` | no |
| <a name="input_s3_origin_id"></a> [s3\_origin\_id](#input\_s3\_origin\_id) | n/a | `any` | n/a | yes |
| <a name="input_ssl_support_method"></a> [ssl\_support\_method](#input\_ssl\_support\_method) | n/a | `string` | `"sni-only"` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | n/a | `map(any)` | <pre>{<br>  "a": null,<br>  "cname": "300",<br>  "default_cache_behavior_default": "3600",<br>  "default_cache_behavior_max": "86400",<br>  "default_cache_behavior_min": "0",<br>  "ns": "172800",<br>  "ordered_cache_behavior_precedence_0_default": "86400",<br>  "ordered_cache_behavior_precedence_0_max": "31536000",<br>  "ordered_cache_behavior_precedence_0_min": "0",<br>  "ordered_cache_behavior_precedence_1_default": "3600",<br>  "ordered_cache_behavior_precedence_1_max": "86400",<br>  "ordered_cache_behavior_precedence_1_min": "0",<br>  "soa": "900",<br>  "txt": "1800"<br>}</pre> | no |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | n/a | `map(string)` | <pre>{<br>  "default_cache_behavior": "redirect-to-https",<br>  "ordered_cache_behavior_precedence_0": "redirect-to-https",<br>  "ordered_cache_behavior_precedence_1": "redirect-to-https"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudfront_distribution"></a> [aws\_cloudfront\_distribution](#output\_aws\_cloudfront\_distribution) | n/a |
