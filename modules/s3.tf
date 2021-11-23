resource "aws_s3_bucket" "devout_website" {
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

resource "aws_s3_bucket_policy" "devout_bucket_policy" {
  bucket = aws_s3_bucket.devout_website.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "devoutBUCKETPOLICY"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.devout_website.arn,
          "${aws_s3_bucket.devout_website.arn}/*",
        ]
      },
    ]
  })
}

# data "aws_s3_bucket" "devout_s3_bucket" {
#   domain_name = aws_s3_bucket.devout_website.domain_name
# }

resource "aws_s3_bucket_object" "object" {
for_each = fileset("myfiles/", "*")
bucket = aws_s3_bucket.devout_website.id
key = each.value
source = "myfiles/${each.value}"
etag = filemd5("myfiles/${each.value}")
}