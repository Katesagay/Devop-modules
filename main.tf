module "s3" {
  source        = "./modules/s3/"
  domain_name   = var.domain_name
  bucket_acl    = var.bucket_acl
  force_destroy = var.force_destroy
}

module "route53" {
  source                              = "./modules/route53/"
  cloudfront_distribution_domain_name = module.cloudfront.aws_cloudfront_distribution.domain_name
  zone_id                             = module.cloudfront.aws_cloudfront_distribution.hosted_zone_id
  domain_name                         = var.domain_name
}

module "cloudfront" {
  source             = "./modules/cloudfront/"
  origin_domain_name = module.s3.aws_s3_bucket_name.bucket_regional_domain_name
  bucket_name        = module.s3.aws_s3_bucket_name.bucket_domain_name
  s3_origin_id       = "S3-${module.s3.aws_s3_bucket_name.id}"
}

module "cloudfront_alarm" {
  source          = "./global/cloudwatch/modules/cloudfront/"
  actions_enabled = var.cloudfront_actions_enabled
  distribution_id = var.distribution_id
  arn             = module.alert_distribution_alarm.cloudwatch-alarm-topic.arn

}

module "s3_alarm" {
  source          = "./global/cloudwatch/modules/s3/"
  actions_enabled = var.S3_actions_enabled
  domain_name     = var.domain_name
  arn             = module.alert_distribution_alarm.cloudwatch-alarm-topic.arn
}

module "alert_distribution_alarm" {
  source        = "./global/cloudwatch/modules/alert_distribution/"
  email_address = var.email_address
  topic_name    = var.topic_name
  sns           = var.sns
  sns_name      = module.s3.aws_s3_bucket_name.bucket
}


