variable "aws_s3_bucket" {
    description = "S3 bucket name"
    type        = map(string)
    default     = {
    
        bucket_tags = "day2-nti-hire-bucket-tag"
        bucket_name = "day2-nti-hire-bucket-reda"
        region      = "us-east-1"

    }
  
}