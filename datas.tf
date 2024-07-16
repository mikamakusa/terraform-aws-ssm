data "aws_s3_bucket" "this" {
  count  = var.bucket_name ? 1 : 0
  bucket = var.bucket_name
}

data "aws_kms_key" "this" {
  count  = var.kms_key_name ? 1 : 0
  key_id = var.kms_key_name
}