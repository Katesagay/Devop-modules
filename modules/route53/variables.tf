variable "domain_name" {
  type    = string
  default = ""
}
variable "zone_id" {}

variable "cloudfront_distribution_domain_name" {}

variable "evaluate_target_health" {   
  type    = bool
  default = false
}


