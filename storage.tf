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

    status = Enabled

  }
}