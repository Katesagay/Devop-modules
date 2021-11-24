
variable "threshold" {
  type = number
  default = 1
}
variable "sns" {
  type = map(string)
  description = "(optional) describe your variable"
}
variable "email_address_list" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "bucket"{
  type = string
  description = "(optional) describe your variable"
  default = ""
}
