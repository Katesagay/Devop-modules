resource "aws_route53_zone" "devout_zone" {
  name = var.domain_names[0]
}

data "aws_route53_zone" "devout_zone" {
  name = var.domain_names[0]
}


resource "aws_route53_record" "devout_a_record" {
  for_each = toset(var.domain_names)
  zone_id  = "${data.aws_route53_zone.devout_zone.zone_id}"
  name     = each.value
  type     = "A"
  alias {
    name                   = replace(aws_cloudfront_distribution.devout.domain_name, "/[.]$/", "")
    zone_id                = "${aws_cloudfront_distribution.devout.hosted_zone_id}"
    evaluate_target_health = false
  }
   depends_on = [aws_cloudfront_distribution.devout]
}
# resource "aws_route53_record" "devout_nsrecord" {
#   allow_overwrite = true
#   zone_id = aws_route53_zone.devout_zone.zone_id
#   name    = var.domain_names
#   type    = "NS"
#   ttl     = var.ttl["ns"]
#   records = [
#     aws_route53_zone.devout_zone.name_servers[0],
#     aws_route53_zone.devout_zone.name_servers[1],
#     aws_route53_zone.devout_zone.name_servers[2],
#     aws_route53_zone.devout_zone.name_servers[3],
#   ]

# resource "aws_route53_record" "devout_soarecord" {
#   allow_overwrite = true
#   zone_id = aws_route53_zone.devout_zone.zone_id
#   name    = var.domain_names[0]
#   type    = "SOA"
#   ttl     = var.ttl["soa"]
#   records
# }
# resource "aws_route53_record" "devout_cnamerecord" {
#   zone_id = aws_route53_zone.devout_zone.zone_id
#   name    = var.domain_names[0]
#   type    = "CNAME"
#   ttl     = var.ttl["cname"]
#   records
# }
# resource "aws_route53_record" "wwwdevout_cnamerecord" {
#   zone_id = aws_route53_zone.devout_zone.zone_id
#   name    = "${var.domain_names[1]}"
#   type    = "CNAME"
#   ttl     = var.ttl["cname"]
# records
# }


# resource "aws_route53_record" "devout_txtrecord" {
#   zone_id = aws_route53_zone.devout_zone.zone_id
#   name    = "_amazonses.${aws_ses_domain_identity.domain.id}"
#   type    = "TXT"
#   ttl     = var.ttl["txt"]
#   records = [aws_ses_domain_identity.domain.verification_token]
# }

