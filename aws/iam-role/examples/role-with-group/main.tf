data "aws_caller_identity" "current" {}

module "iam_group" {
  source = "../../../iam-group"

  group_name            = "example-group"
  group_membership_name = "membership-for-example"

  policy_name        = "example-group-policy"
  policy_description = "this is example group policy"
  policy             = data.aws_iam_policy_document.assume_role_policy.json

  user_names = [
    "example-user-1",
    "example-user-2",
  ]
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"]
  }
}

module "iam_role" {
  source = "../../../iam-role"

  role_name        = "example-role"
  role_description = "this is example role"
  trust_policy     = data.aws_iam_policy_document.trust_policy.json

  policy_name        = "example-policy"
  policy_description = "this is example policy"
  policy             = data.aws_iam_policy_document.policy.json
}

data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = module.iam_group.user_arns
    }
  }
}

data "aws_iam_policy_document" "policy" {}
