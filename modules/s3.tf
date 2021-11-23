resource "aws_s3_bucket" "devout" {
  bucket = "devout.dev"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "404.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://devout.dev"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  versioning {

    enabled = true
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
  for_each     = fileset("../devoutS3Files/", "*")
  bucket       = aws_s3_bucket.devout.id
  key          = each.value
  source       = "../devoutS3Files/${each.value}"
  etag         = filemd5("../devoutS3Files/${each.value}")
  content_type = "text/html"
}