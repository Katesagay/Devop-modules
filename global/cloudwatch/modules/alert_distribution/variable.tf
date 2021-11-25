
variable "threshold" {
  type        = number
  description = "Threshold to trigger action"
  default     = 1
}
variable "topic_name" {}
variable "sns" {
  type        = map(string)
  description = "Name of sns topic"
  default     = {}
}
variable "email_address" {
  type        = string
  description = "Email address of respondent"
  default     = ""
}
variable "domain_name" {
  type        = string
  description = "Domain name"
  default     = ""
}
variable "protocol" {
  type        = string
  description = "Type of protocol"
  default     = "email"

}

variable "sns_name" {}