## Cria um Bucket S3
resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = merge({ Name = format("%s-bucket-s3", var.project_name) }, local.common_tags)
}

## Envia um arquivo para o Bucket S3
resource "aws_s3_object" "bike" {
  bucket = aws_s3_bucket.main.id
  key    = "bike"
  source = "bike.jpg"
}
