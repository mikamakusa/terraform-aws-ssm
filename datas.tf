data "aws_default_tags" "this" {}

data "aws_iam_role" "this" {
  count = var.iam_role_name ? 1 : 0
  name = var.iam_role_name
}

data "aws_iam_policy_document" "AmazonSSMManagedInstanceCore" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ssm.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}