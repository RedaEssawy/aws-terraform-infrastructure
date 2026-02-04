resource "aws_s3_bucket" "name" {
    bucket = var.aws_s3_bucket["bucket_name"]
    region = var.aws_s3_bucket["region"]
    tags = {
      "key" = var.aws_s3_bucket["bucket_tags"]
    }
}