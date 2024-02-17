# Required
variable "name" {
  description = "IAM role name"
  type        = string
}

variable "description" {
  description = "IAM role description"
  type        = string
}

variable "trust_policy" {
  description = "Trust policy in JSON formatted string"
  type        = string
}

# Optional
variable "managed_policy_arns" {
  description = "Managed policy ARN list"
  type        = list(string)
  default     = []
}

variable "policy" {
  description = "IAM role policy in JSON formatted string"
  type        = string
  default     = ""
}

variable "policy_name" {
  description = "IAM role policy name"
  type        = string
  default     = ""
}

variable "policy_description" {
  description = "IAM role policy description"
  type        = string
  default     = ""
}
