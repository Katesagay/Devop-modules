module "route53" {

}
module "cloudfront" {

}



module "s3" {
  source             = "./modules/s3/"
  actions_enabled    = true
  evaluation_periods = "1"
  period             = "60"
  threshold          = "1"
  bucket             = "devout.dev"
  StorageType        = "AllStorageTypes"
  arn                = module.alert_distribution.cloudwatch-alarm-topic.arn
}

module "alert_distribution" {
  source             = "./modules/alert_distribution/"
  email_address_list = ""
  sns = {
    name         = "devops-cloudwatch-alarm-topic"
    display_name = "cloudwatch-alarm-topic"
    region       = "eu-west-1"
  account-id = "" }
  threshold = 5
}