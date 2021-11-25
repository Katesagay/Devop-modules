resource "aws_cloudfront_distribution" "devout" {
  origin {
    domain_name = var.origin_domain_name
    origin_id   = var.s3_origin_id
  }
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object

  logging_config {
    include_cookies = var.include_cookies
    bucket          = var.bucket_name
    prefix          = var.prefix
  }

  default_cache_behavior {
    allowed_methods  = var.allowed_methods["default_cache_behavior"]
    cached_methods   = var.cached_methods["default_cache_behavior"]
    target_origin_id = var.s3_origin_id

    forwarded_values {
      query_string = var.query_string["default_cache_behavior"]

      cookies {
        forward = var.cookies_forward["default_cache_behavior"]
      }
    }

    viewer_protocol_policy = var.viewer_protocol_policy["default_cache_behavior"]
    min_ttl                = var.ttl["default_cache_behavior_min"]
    default_ttl            = var.ttl["default_cache_behavior_default"]
    max_ttl                = var.ttl["default_cache_behavior_max"]
  }

  ordered_cache_behavior {
    path_pattern     = var.path_pattern["ordered_cache_behavior_precedence_0"]
    allowed_methods  = var.allowed_methods["ordered_cache_behavior_precedence_0"]
    cached_methods   = var.cached_methods["ordered_cache_behavior_precedence_0"]
    target_origin_id = var.s3_origin_id

    forwarded_values {
      query_string = var.query_string["ordered_cache_behavior_precedence_0"]
      headers      = var.headers

      cookies {
        forward = var.cookies_forward["ordered_cache_behavior_precedence_0"]
      }
    }

    min_ttl                = var.ttl["ordered_cache_behavior_precedence_0_min"]
    default_ttl            = var.ttl["ordered_cache_behavior_precedence_0_default"]
    max_ttl                = var.ttl["ordered_cache_behavior_precedence_0_max"]
    compress               = var.compress["ordered_cache_behavior_precedence_0"]
    viewer_protocol_policy = var.viewer_protocol_policy["ordered_cache_behavior_precedence_0"]
  }

  ordered_cache_behavior {
    path_pattern     = var.path_pattern["ordered_cache_behavior_precedence_1"]
    allowed_methods  = var.allowed_methods["ordered_cache_behavior_precedence_1"]
    cached_methods   = var.cached_methods["ordered_cache_behavior_precedence_1"]
    target_origin_id = var.s3_origin_id

    forwarded_values {
      query_string = var.query_string["ordered_cache_behavior_precedence_1"]

      cookies {
        forward = var.cookies_forward["ordered_cache_behavior_precedence_1"]
      }
    }

    min_ttl                = var.ttl["ordered_cache_behavior_precedence_1_min"]
    default_ttl            = var.ttl["ordered_cache_behavior_precedence_1_default"]
    max_ttl                = var.ttl["ordered_cache_behavior_precedence_1_max"]
    compress               = var.compress["ordered_cache_behavior_precedence_1"]
    viewer_protocol_policy = var.viewer_protocol_policy["ordered_cache_behavior_precedence_1"]
  }

  price_class = lookup(var.price_class, terraform.workspace)

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.locations
    }
  }

  tags = {
    Environment = terraform.workspace
    Created     = timestamp()
  }

  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
    ssl_support_method             = var.ssl_support_method
  }
}

# data "aws_cloudfront_distribution" "devout" {
#   id = aws_cloudfront_distribution.devout.id
# }


output "aws_cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.devout
}