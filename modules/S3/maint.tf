
resource "random_id" "server" {

  byte_length = 8
}


resource "aws_kms_key" "geo-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


resource "aws_s3_bucket" "bucket-kms-key" {
  bucket = random_id.server.hex

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.geo-key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}


resource "aws_s3_bucket_acl" "geo-acl" {
  bucket = random_id.server.hex
  acl    = "private"
}


resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = random_id.server.hex
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}


data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

  }
}


