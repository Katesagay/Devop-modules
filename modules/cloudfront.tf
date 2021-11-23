resource "aws_cloudfront_distribution" "devout" {
  origin {
    domain_name = aws_s3_bucket.devout_website.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    # s3_origin_config {
    #   origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    # }
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "managed by terraform"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "devout.dev.s3.amazonaws.com"
    prefix          = "devout"
  }

  # aliases = ["devout.dev", "www.devout.dev"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = null
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method             = "sni-only"
  }
}




# data "aws_route53_zone" "devout_zone" {
#   name = aws_cloudfront_distribution.devout.domain_name
# }

data "aws_cloudfront_distribution" "devout_cloudfront_distribution" {
  id = aws_cloudfront_distribution.devout.id
}






# resource "aws_route53_record" "devout_ns_record" {
#   zone_id  = aws_route53_zone.devout_zone.id
#   name     = var.domain_names[0]
#   type     = "NS"
#   alias {
#     name                   = aws_route53_zone.devout_zone.name
#     zone_id                = aws_route53_zone.devout_zone.id
#     evaluate_target_health = false
#   }
# }

# resource "aws_route53_record" "devout_soa_record" {
#   zone_id  = aws_route53_zone.devout_zone.id
#   name     = var.domain_names[0]
#   type     = "SOA"
#   alias {
#     name                   = aws_route53_zone.devout_zone.name
#     zone_id                = aws_route53_zone.devout_zone.id
#     evaluate_target_health = false
#   }
# }

# resource "aws_route53_record" "devout_cname_record" {
#   for_each = toset(var.domain_names)
#   zone_id  = aws_route53_zone.devout_zone.id
#   name     = each.value
#   type     = "cname"
#   alias {
#     name                   = data.aws_cloudfront_distribution.devout_cloudfront_distribution.domain_name
#     zone_id                = data.data.aws_route53_zone.devout_zone.hosted_zone_id
#     evaluate_target_health = false
#   }
# }


