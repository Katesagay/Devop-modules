variable "actions_enabled"{
  description = "Enable actions"
  type        = bool
  default     = true
}
variable "domain_name"{
  description = "S3 bucket name and domain name"
  type        = string
  default     = ""
}
variable "evaluation_periods"{
  description = "Number of periods to look back"
  type        = number
  default     = 1
}
variable "period"{
  description = "Period to look back"
  type        = number
  default     = 60
}
variable "threshold"{
  description = "Threshold to trigger action"
  type        = number
  default     = 1
}
variable "storage_type"{
  description = "Storage type"
  type        = string
  default     = "AllStorageTypes"
}
variable "arn"{}