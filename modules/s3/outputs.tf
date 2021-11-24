output "aws_s3_bucket_name" {
  value = "${aws_s3_bucket.devout}"
}
output "website" {
  value = "${aws_s3_bucket.devout.website_endpoint}"
}