
variable "domain_name" {
  type    = string
  default = ""
}

variable "bucket_acl" {
    type    = string
  default = "public-read"
}

variable "cors_rule" {
    type    =  object({
    allowed_headers = any  
   allowed_methods = any
     expose_headers = any
     max_age_seconds = any
  })
  default = {
 allowed_headers = ["*"],
  allowed_methods = ["PUT", "POST"],
  expose_headers = ["ETag"],
  max_age_seconds = "3000"

  }
}

variable "index_document" {
   type    = string
  default = "index.html"
}
variable "error_document" {
   type    = string
  default = "404.html"
}

variable "bucket_versioning_enabled" {
    type    = bool
  default = true  
}

variable "html_directory" {
  type = string
  default = "././devoutS3Files/"
}
variable "content_type" { 
  type = string
  default = "text/html"
  
}