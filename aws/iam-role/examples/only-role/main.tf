module "iam_role" {
  source = "../../"

  role_name = "example-role"
  role_description = "this is example role"
  trust_policy = data.aws_iam_policy_document.trust_policy.json

  policy_name = "example-policy"
  policy_description = "this is example policy"
  policy = data.aws_iam_policy_document.policy.json
}

data "aws_iam_policy_document" "trust_policy" {}

data "aws_iam_policy_document" "policy" {}
