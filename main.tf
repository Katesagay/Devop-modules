module "s3" {
  source = "./modules/s3/"
  domain_name                  = "devout.dev"
  # bucket_acl                = var.bucket_acl
  # metatags of css to cee                terraform output website issue
}

module "route53" {
  source                              = "./modules/route53/"
  cloudfront_distribution_domain_name = module.cloudfront.aws_cloudfront_distribution.domain_name
  zone_id                             = module.cloudfront.aws_cloudfront_distribution.hosted_zone_id
  domain_name                        = "devout.dev"
}

module "cloudfront" {
  source             = "./modules/cloudfront/"
  origin_domain_name = module.s3.aws_s3_bucket_name.bucket_regional_domain_name
  bucket_name        = module.s3.aws_s3_bucket_name.bucket_domain_name
  s3_origin_id       = "S3-${module.s3.aws_s3_bucket_name.id}"
}













module "cloudfront_alarm" {
  source          = "./global/cloudwatch/modules/cloudfront/"
  distribution_id = "ENVIPJPV5V6ES"
  arn = module.alert_distribution_alarm.cloudwatch-alarm-topic.arn
  alarms = { 
    "4xxErrorRate" = {
    threshold = 5
  },
  "5xxErrorRate" = {
    threshold = 5
  }
}
}


module "s3_alarm" {
  source             = "./global/cloudwatch/modules/s3/"
  actions_enabled    = true
  evaluation_periods = "1"
  period             = "60"
  threshold          = "1"
  domain_name         = "devout.dev"
  storage_type        = "AllStorageTypes"
  arn                = module.alert_distribution_alarm.cloudwatch-alarm-topic.arn
}

module "alert_distribution_alarm" {
  source             = "./global/cloudwatch/modules/alert_distribution/"
  email_address = "kate_sagay@hotmail.com"
  threshold = 5
  topic_name = "devout"
  sns = { 
    region = "eu-west-1"
  account-id = "030204052122" }
  # needs to sort out the sns name and its harcoded needs to charge for the envirmoment
    sns_name         = module.s3.aws_s3_bucket_name.bucket
}


