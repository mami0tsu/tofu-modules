module "iam_role" {
  source = "../../"

  role_name        = "example-role"
  role_description = "this is example role"
  trust_policy     = data.aws_iam_policy_document.trust_policy.json

  managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["${data.aws_caller_identity.current.account_id}"]
    }
  }
}
