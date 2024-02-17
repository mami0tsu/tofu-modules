terraform {
  required_version = "1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33"
    }
  }
}

resource "aws_iam_group" "this" {
  name = var.name
}

resource "aws_iam_user" "this" {
  for_each = toset(var.user_names)
  name     = each.value
}

resource "aws_iam_group_membership" "this" {
  name  = var.group_membership_name
  group = aws_iam_group.this.name
  users = values(aws_iam_user.this)[*].name
}

resource "aws_iam_policy" "this" {
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.this.arn
}
