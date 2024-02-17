terraform {
  required_version = "1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33"
    }
  }
}

resource "aws_iam_role" "this" {
  name                = var.role_name
  description         = var.role_description
  assume_role_policy  = var.trust_policy
  managed_policy_arns = var.managed_policy_arns
  inline_policy {}

  lifecycle {
    precondition {
      condition = !(length(var.policy) > 0 && length(var.managed_policy_arns) > 0)
    error_message = "The policy attached to IAM role must be AWS managed policy or customer managed policy."
 }   
  }
}

resource "aws_iam_policy" "this" {
  count = length(var.policy_name) > 0 && length(var.policy_description) > 0 && length(var.policy) > 0 ? 1 : 0
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.policy_name) > 0 && length(var.policy_description) > 0 && length(var.policy) > 0 ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this[0].arn
}
