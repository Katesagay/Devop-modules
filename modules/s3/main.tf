resource "aws_s3_bucket" "devout" {
  bucket = local.bucket_name
  acl    = var.bucket_acl
  policy =jsonencode({
    Version = "2012-10-17"
    Id      = "Policy1562539893344"
    Statement = [
      {
        Sid       = "Stmt1562539892089"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = ["arn:aws:s3:::${local.bucket_name}/*",
        ]
      },
    ]
  })


  website {
    index_document =  var.index_document
    error_document =  var.error_document

    routing_rules = file("./modules/s3/routing_rules.json")
  }
  cors_rule {
    allowed_headers = var.cors_rule.allowed_headers
    allowed_methods = var.cors_rule.allowed_methods
    allowed_origins = ["https://${local.bucket_name}"]
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
  content_type =  (each.value != "*.css" ? "text/html" : "text/css")
  # if filename ends with .css then metadata = text/css and content_type = text/css
  
}
