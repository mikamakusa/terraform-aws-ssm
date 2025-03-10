module "iam" {
  source = "modules/terraform-aws-iam"
  role = var.iam_role
  policy_attachment = var.iam_policy_attachment
}

module "s3" {
  source = "modules/terraform-aws-s3"
  bucket = []
}

module "kms" {
  source = "modules/terraform-aws-kms"
  key = var.kms_key
}