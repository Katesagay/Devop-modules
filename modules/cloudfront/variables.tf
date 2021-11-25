variable "origin_domain_name" {}

variable "domain_names" {
  type    = list(any)
  default = []
}

variable "ttl" {
  type = map(any)
  default = {
    "cname" : "300",
    "ns" : "172800",
    "a" : null,
    "txt" : "1800",
    "soa" : "900",
    "default_cache_behavior_min" : "0",
    "default_cache_behavior_default" : "3600",
    "default_cache_behavior_max" : "86400",
    "ordered_cache_behavior_precedence_0_min" : "0",
    "ordered_cache_behavior_precedence_0_default" : "86400",
    "ordered_cache_behavior_precedence_0_max" : "31536000",
    "ordered_cache_behavior_precedence_1_min" : "0",
    "ordered_cache_behavior_precedence_1_default" : "3600",
    "ordered_cache_behavior_precedence_1_max" : "86400"
  }
}

variable "cloudfront_distribution" {
  type    = string
  default = ""
}

variable "s3_origin_id" {
}
variable "enabled" {
  type    = bool
  default = true
}
variable "is_ipv6_enabled" {
  type    = bool
  default = true
}
variable "comment" {
  type    = string
  default = "managed by terraform"
}
variable "default_root_object" {
  type    = string
  default = "index.html"
}
variable "include_cookies" {
  type    = bool
  default = false
}

variable "bucket_name" {
}
variable "prefix" {
  type    = string
  default = "logs/"
}
variable "allowed_methods" {
  type = map(list(string))
  default = {
    "default_cache_behavior" : ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"],
    "ordered_cache_behavior_precedence_0" : ["GET", "HEAD", "OPTIONS"],
    "ordered_cache_behavior_precedence_1" : ["GET", "HEAD", "OPTIONS"],
  }
}
variable "cached_methods" {
  type = map(list(string))
  default = {
    "default_cache_behavior" : ["GET", "HEAD"],
    "ordered_cache_behavior_precedence_0" : ["GET", "HEAD", "OPTIONS"],
    "ordered_cache_behavior_precedence_1" : ["GET", "HEAD"],
  }
}
variable "query_string" {
  type = map(string)
  default = {
    "default_cache_behavior" : false,
    "ordered_cache_behavior_precedence_0" : false,
    "ordered_cache_behavior_precedence_1" : false,
  }
}
variable "cookies_forward" {
  type = map(string)
  default = {
    "default_cache_behavior" : "none",
    "ordered_cache_behavior_precedence_0" : "none",
    "ordered_cache_behavior_precedence_1" : "none",
  }
}
variable "viewer_protocol_policy" {
  type = map(string)
  default = {
    "default_cache_behavior" : "redirect-to-https",
    "ordered_cache_behavior_precedence_0" : "redirect-to-https",
    "ordered_cache_behavior_precedence_1" : "redirect-to-https",
  }
}

variable "path_pattern" {
  type = map(string)
  default = {
    "ordered_cache_behavior_precedence_0" : "/content/immutable/*",
    "ordered_cache_behavior_precedence_1" : "/content/*",
  }
}
variable "headers" {
  type    = list(any)
  default = ["Origin"]
}
variable "price_class" {
  type = map(string)
  default = {
    default = "PriceClass_100"
    dev     = "PriceClass_200"
    prod    = "PriceClass_All"
  }
}
variable "restriction_type" {
  type    = string
  default = "none"
}
variable "locations" {
  type    = list(string)
  default = null
}
variable "cloudfront_default_certificate" {
  type    = bool
  default = true
}
variable "ssl_support_method" {
  type    = string
  default = "sni-only"
}
variable "compress" {
  type = map(string)
  default = {
    "ordered_cache_behavior_precedence_0" : true,
    "ordered_cache_behavior_precedence_1" : true,
  }
}
variable "evaluate_target_health" {
  type    = bool
  default = false
}
