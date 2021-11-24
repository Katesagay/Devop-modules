variable "distribution_id"{
  description = "Distribution ID"
  type = string
  default = "test-distribution-id"
}
variable "actions_enabled"{
  description = "Enable actions"
  type        = bool
  default     = true
}
# variable ""{
#   description = ""
#   type        = string
#   default     = ""
# }
variable "evaluation_periods"{
  description = "Number of periods to look back"
  type        = number
  default     = 1
}
variable "period"{
  description = "Period to look back"
  type        = string
  default     = ""
}
variable "default_threshold"{
  description = "Threshold to trigger action"
  type        = number
  default     = 1
}
# variable ""{
#   description = ""
#   type        = string
#   default     = ""
# }
variable "arn"{}
variable "alarms" {
  type = map(any)
  default = {}
}