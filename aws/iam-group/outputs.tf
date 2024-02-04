output "user_arns" {
  value     = values(aws_iam_user.this)[*].arn
  sensitive = true
}
