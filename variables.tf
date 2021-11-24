variable "domain_names" {
  type    = list(any)
  default = []
}
variable "soa_record" {
  type    = string
  default = ""
}
variable "a_record" {
  type    = string
  default = ""
}

variable "cname_record" {
  type    = string
  default = ""
}
variable "cname_wwwrecord" {
  type    = string
  default = ""
}
variable "ns_record" {
  type    = list(any)
  default = []
}

variable "ttl" {
  type    = map(any)
  default = {}
}

variable "zone_id" {
}

variable "cloudfront_distribution_domain_name" {
}

variable "email" {
  type    = list(string)
  default = []

}
variable "s3_origin_id" {
  type    = string
  default = ""
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
  default = ""
}
variable "default_root_object" {
  type    = string
  default = ""
}
variable "include_cookies" {
  type    = bool
  default = false
}
variable "bucket" {
  type    = string
  default = ""
}
variable "prefix" {
  type    = string
  default = ""
}
variable "allowed_methods" {
  type    = map(list(string))
  default = {}
}
variable "cached_methods" {
  type    = map(list(string))
  default = {}
}
variable "query_string" {
  type    = map(string)
  default = {}
}
variable "cookies_forward" {
  type    = map(string)
  default = {}
}
variable "viewer_protocol_policy" {
  type    = map(string)
  default = {}
}

variable "path_pattern" {
  type    = map(string)
  default = {}
}
variable "headers" {
  type    = list(any)
  default = []
}
variable "price_class" {
  type    = map(string)
  default = {}
}
variable "restriction_type" {
  type    = string
  default = ""
}
variable "locations" {
  type    = list(string)
  default = []
}
variable "cloudfront_default_certificate" {
  type    = bool
  default = true
}
variable "ssl_support_method" {
  type    = string
  default = ""
}
variable "compress" {
  type    = map(string)
  default = {}
}

variable "evaluate_target_health" {
  type    = bool
  default = false
}

variable "bucket_acl" {
  type    = string
  default = ""
}
variable "bucket_policy" {
  type    = string
  default = ""
}
variable "cors_rule" {
  type = object({
    allowed_headers = any
    allowed_methods = any
    allowed_origins = any
    expose_headers  = any
    max_age_seconds = any
  })
  default = {
    allowed_headers = ["*"],
    allowed_methods = ["PUT", "POST"],
    allowed_origins = ["https://devout.dev"],
    expose_headers  = ["ETag"],
    max_age_seconds = "3000"

  }
}

variable "index_document" {
  type    = string
  default = ""
}
variable "error_document" {
  type    = string
  default = ""
}

variable "bucket_versioning_enabled" {
  type    = bool
  default = true
}

variable "html_directory" {
  type    = string
  default = ""
}
variable "content_type" {
  type    = string
  default = ""

}