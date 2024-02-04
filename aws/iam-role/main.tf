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
  managed_policy_arns = []
  inline_policy {}
}

resource "aws_iam_policy" "this" {
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
