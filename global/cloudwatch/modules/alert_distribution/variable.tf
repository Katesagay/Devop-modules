
variable "threshold" {
  type = number
  default = 1
}
variable "topic_name" {}
variable "sns" {
  type = map(string)
  description = "(optional) describe your variable"
  default = {}
}
variable "email_address" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "domain_name"{
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "protocol" {
  type = string
  description = "value"
  default = "email"
  
}

variable "sns_name" {}