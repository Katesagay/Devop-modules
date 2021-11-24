resource "aws_route53_zone" "devout" {
  name = var.domain_names[0]
}

data "aws_route53_zone" "devout" {
  name = var.domain_names[0]
  depends_on = [
    aws_route53_zone.devout
  ]
}


resource "aws_route53_record" "devout_a_record" {
  for_each = toset(var.domain_names)
  zone_id  = data.aws_route53_zone.devout.zone_id
  name     = each.value
  type     = "A"
  alias {  
    name                   = replace(var.cloudfront_distribution_domain_name, "/[.]$/", "")
    zone_id                = var.zone_id
    evaluate_target_health = var.evaluate_target_health
  }
  depends_on = [var.zone_id]
}

