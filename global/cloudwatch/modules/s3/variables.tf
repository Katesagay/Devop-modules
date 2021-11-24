variable "actions_enabled"{
  description = "Enable actions"
  type        = bool
  default     = true
}
variable "bucket"{
  description = "S3 bucket name"
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
  type        = string
  default     = ""
}
variable "threshold"{
  description = "Threshold to trigger action"
  type        = number
  default     = 1
}
variable "StorageType"{
  description = "Storage type"
  type        = string
  default     = ""
}
variable "arn"{}