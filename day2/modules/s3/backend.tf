# terraform {
#   backend "s3" {
#     bucket = var.aws_s3_bucket["bucket_name"]
#     key    = "../terraform.tfstate"
#     region = var.aws_s3_bucket["region"]   
#     dynamodb_table = "state-locking"
    
#   }
# }