
resource "aws_sns_topic" "cloudwatch-alarm-topic" {
  name         = "${var.topic_name}-cloudwatch-alarm-topic"
  display_name = "${var.topic_name}-cloudwatch-alarm-topic"
  policy       = data.aws_iam_policy_document.sns-topic-policy.json
}
resource "aws_sns_topic_subscription" "sns-topic" {
  topic_arn = aws_sns_topic.cloudwatch-alarm-topic.arn
  protocol  = var.protocol
  endpoint  = var.email_address

}

data "aws_iam_policy_document" "sns-topic-policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        var.sns["account-id"],
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "arn:aws:sns:${var.sns["region"]}:${var.sns["account-id"]}:${var.sns_name}-sns-topic}",
    ]

    sid = "__default_statement_ID"
  }
}
output "cloudwatch-alarm-topic" {
  value = aws_sns_topic.cloudwatch-alarm-topic
}
