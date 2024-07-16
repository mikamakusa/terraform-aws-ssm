resource "aws_s3_bucket" "this" {
  count               = length(var.s3_bucket)
  bucket              = lookup(var.s3_bucket[count.index], "bucket")
  bucket_prefix       = lookup(var.s3_bucket[count.index], "bucket_prefix")
  force_destroy       = lookup(var.s3_bucket[count.index], "force_destroy")
  object_lock_enabled = lookup(var.s3_bucket[count.index], "object_lock_enabled")
  tags = merge(
    var.tags,
    lookup(var.patch_baseline[count.index], "tags"),
    data.aws_default_tags.this.tags
  )
}