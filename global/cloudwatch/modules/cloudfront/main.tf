resource "aws_cloudwatch_metric_alarm" "cloudfront_500" {
  actions_enabled     = true
  alarm_name          = "${local.website_distribution_id}_cloudfront_alarm"
  alarm_description   = "Alarm for ${var.distribution_id}"
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/CloudFront"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.threshold_500
  period              = "60"
  evaluation_periods  = var.evaluation_periods_500
  alarm_actions       = [var.arn]
  dimensions = {
    "DistributionId" = "${var.distribution_id}"
    "Region"         = "global"
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudfront_400" {
  actions_enabled     = true
  alarm_name          = "${local.website_distribution_id}_cloudfront_alarm"
  alarm_description   = "Alarm for ${var.distribution_id}"
  metric_name         = "4xxErrorRate"
  namespace           = "AWS/CloudFront"
  statistic           = "Sum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.threshold_400
  period              = "60"
  evaluation_periods  = var.evaluation_periods_400
  alarm_actions       = [var.arn]
  dimensions = {
    "DistributionId" = "${var.distribution_id}"
    "Region"         = "global"
  }
}




