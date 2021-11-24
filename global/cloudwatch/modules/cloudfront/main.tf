resource "aws_cloudwatch_metric_alarm" "cloudfront" {
count = length(var.alarms)
 actions_enabled = true
alarm_name = join("", ["${local.environment_prefix}"],["${var.distribution_id}_cloudfront_alarm"])
alarm_description = "Alarm for ${var.distribution_id}"
metric_name = "5xxErrorRate"  
namespace = "AWS/CloudFront"
statistic = "Sum"
comparison_operator = "GreaterThanThreshold"
threshold = lookup(var.alarms[element(keys(var.alarms), count.index)],"threshold",var.default_threshold)
period = "60"
evaluation_periods = "1"
alarm_actions = [var.arn]
dimensions = {
  "DistributionId" = "${var.distribution_id}"
  "Region"= "global"
}


}
# "4xxErrorRate"



