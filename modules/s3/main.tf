resource "aws_s3_bucket" "devout" {
  bucket =  join("", ["${local.environment_prefix}"],["${var.bucket}"])
  acl    = var.bucket_acl
  policy = file("./policy.json")

  website {
    index_document =  var.index_document
    error_document =  var.error_document

    routing_rules = file("./routing_rules.json")
  }
  
  cors_rule {
    allowed_headers = var.cors_rule.allowed_headers
    allowed_methods = var.cors_rule.allowed_methods
    allowed_origins = var.cors_rule.allowed_origins
    expose_headers  = var.cors_rule.expose_headers
    max_age_seconds = var.cors_rule.max_age_seconds
  }

  versioning {

    enabled = var.bucket_versioning_enabled
  }

} 

resource "aws_s3_bucket_policy" "devout" {
  bucket = aws_s3_bucket.devout.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "DEVOUTBUCKETPOLICY"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.devout.arn,
          "${aws_s3_bucket.devout.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_bucket_object" "devout" {
  for_each     = fileset("${var.html_directory}", "*")
  bucket       = aws_s3_bucket.devout.id
  key          = each.value
  source       = join("", ["${var.html_directory}"],["${each.value}"])
  etag         = filemd5(join("", ["${var.html_directory}"],["${each.value}"]))
  content_type =  var.content_type
}
