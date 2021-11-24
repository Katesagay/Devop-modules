resource "aws_cloudwatch_metric_alarm" "s3_numberofbytes" {

  actions_enabled     = var.actions_enabled
  treat_missing_data  = "breaching" 
  alarm_name          = join("", ["${local.environment_prefix}"],["${var.bucket}_s3_alarm"])
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "NumberOfObjects"
  namespace           = "AWS/S3"
  period              = var.period
  statistic           = "Average"
  threshold           = var.threshold
  alarm_description   = "Alert when the number of objects in the s3 ${var.bucket} is less than the threshold ${var.threshold} <runbook>https://google.com</runbook>"
  alarm_actions       = [var.arn]
  ok_actions          = [var.arn]
  tags = {
    createdOn = timestamp()
    createdBy = "terraform"

  }
  dimensions = {
    BucketName  = "${var.bucket}"
    StorageType = "${var.StorageType}"
  }
}