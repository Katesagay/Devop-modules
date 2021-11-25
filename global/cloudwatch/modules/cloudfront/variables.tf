variable "distribution_id" {
  type        = string
  description = "distribution_id"
  default     = ""
}
variable "actions_enabled" {
  type        = bool
  description = "enable actions"
  default     = true
}
variable "domain_name" {
  type        = string
  description = "domain name"
  default     = ""
}
variable "evaluation_periods" {
  description = "Period to look back"
  type        = number
  default     = 1
}
variable "period" {
  type        = string
  description = "Period to look back"
  default     = ""
}
variable "threshold_500" {
  type        = number
  description = "Threshold to trigger action"
  default     = 1
}
variable "threshold_400" {
  type        = number
  description = "Threshold to trigger action"
  default     = 1
}

variable "arn" {}
variable "alarms" {
  type    = map(any)
  default = {}
}
variable "evaluation_periods_400" {
  type        = number
  description = "evaluation period"
  default     = 1
}

variable "evaluation_periods_500" {
  type        = number
  description = "evaluation period"
  default     = 1
}