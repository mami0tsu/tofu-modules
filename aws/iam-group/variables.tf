variable "group_membership_name" {
  description = "IAM group membership name"
  type = string
}

variable "group_name" {
description = "IAM group name"
type = string
}

variable "policy" {
  description = "IAM group policy in JSON formatted string"
  type = string
}

variable "policy_description" {
  description = "IAM group policy description"
  type = string
}

variable "policy_name" {
  description = "IAM group policy name"
  type = string
}

variable "user_names" {
  description = "The list of IAM users assigned to IAM group"
  type = list(string)
}
