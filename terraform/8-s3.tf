## Cria um Bucket S3
resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = merge({ Name = format("%s-bucket-s3", var.project_name) }, local.common_tags)
}

resource "aws_s3_bucket_ownership_controls" "main" {
  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public" {
  bucket = aws_s3_bucket.main.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


## Envia um arquivo para o Bucket S3
resource "aws_s3_object" "bike" {
  bucket = aws_s3_bucket.main.id
  key    = "bike.jpg"
  source = "bike.jpg"
  acl = "public-read"
}

resource "aws_s3_object" "bike2" {
  bucket = aws_s3_bucket.main.id
  key    = "bike2.jpg"
  source = "bike2.jpg"
}
