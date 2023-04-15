# terraform {
#   backend "s3" {
#     bucket = "terraform-backend-state-file-keeprich"
#     #key    = "path/to/my/key"
#     key = "keeprich/terraform/remote/s3/terraform.tfstate"
#     region = "us-east-1"
#     dynamodb_table = "backend-lock-keeprich"
#   }
# }

