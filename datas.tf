data "aws_default_tags" "this" {}

data "aws_iam_role" "this" {
  count = var.iam_role_name ? 1 : 0
  name = var.iam_role_name
}