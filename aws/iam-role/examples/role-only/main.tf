data "aws_caller_identity" "current" {}

module "iam_role" {
  source = "../../"

  name         = "example-role"
  description  = "this is example role"
  trust_policy = data.aws_iam_policy_document.trust_policy.json
}

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
