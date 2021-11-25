variable "actions_enabled" {
  type        = bool
  description = "Enable actions"
  default     = true
}
variable "domain_name" {

  type        = string
  description = "S3 bucket name and domain name"
  default     = ""
}
variable "evaluation_periods" {
  type        = number
  description = "Number of periods to look back"
  default     = 1
}
variable "period" {
  type        = number
  description = "Period to look back"
  default     = 60
}
variable "threshold" {
  type        = number
  description = "Threshold to trigger action"
  default     = 1
}
variable "storage_type" {
  type        = string
  description = "Storage type"
  default     = "AllStorageTypes"
}
variable "arn" {}