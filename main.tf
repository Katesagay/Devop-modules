module "s3" {
  source                    = "./modules/s3/"
  # bucket                    = var.bucket
  # bucket_acl                = var.bucket_acl
  # index_document            = var.index_document
  # error_document            = var.error_document
  # cors_rule                 = var.cors_rule
  # bucket_versioning_enabled = var.bucket_versioning_enabled
  # html_directory            = var.html_directory
  # content_type              = var.content_type
}

module "route53" {
  source                              = "./modules/route53/"
  cloudfront_distribution_domain_name = module.cloudfront.aws_cloudfront_distribution.domain_name
  zone_id                             = module.cloudfront.aws_cloudfront_distribution.hosted_zone_id
  domain_names  = ["www.devout.com","devout.com"]
  # evaluate_target_health              = var.evaluate_target_health
}

module "cloudfront" {
  source                         = "./modules/cloudfront/"
  origin_domain_name             = module.s3.aws_s3_bucket_name.bucket_regional_domain_name
  bucket_name                 = module.s3.aws_s3_bucket_name.bucket_domain_name
  # s3_origin_id                   = var.s3_origin_id
  # enabled                        = var.enabled
  # is_ipv6_enabled                = var.is_ipv6_enabled
  # comment                        = var.comment
  # default_root_object            = var.default_root_object
  # include_cookies                = var.include_cookies
  # prefix                         = var.prefix
  # bucket                         = var.bucket
  # allowed_methods                = var.allowed_methods
  # cached_methods                 = var.cached_methods
  # query_string                   = var.query_string
  # cookies_forward                = var.cookies_forward
  # viewer_protocol_policy         = var.viewer_protocol_policy
  # ttl                            = var.ttl
  # path_pattern                   = var.path_pattern
  # headers                        = var.headers
  # compress                       = var.compress
  # price_class                    = var.price_class
  # restriction_type               = var.restriction_type
  # locations                      = var.locations
  # cloudfront_default_certificate = var.cloudfront_default_certificate
  # ssl_support_method             = var.ssl_support_method
  
}

locals {
  environment_prefix = (terraform.workspace != "prod" ? terraform.workspace : "")
}

