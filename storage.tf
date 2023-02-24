resource "aws_s3_bucket" "mail-masker_bucket" {
  bucket_prefix = "mail-masker.s3.techheresy.com"

  tags = {
    Name        = "mail-masker"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "mail-masker_bucket_lifecycle" {
  bucket = aws_s3_bucket.mail-masker_bucket.id

  rule {
    id = "remove-if-older-than-24h"

    expiration {
      days = 1
    }

    filter {}

    status = "Enabled"

  }
}

resource "aws_s3_bucket_public_access_block" "mail-masker_bucket_public_access_block" {
  bucket = aws_s3_bucket.mail-masker_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
