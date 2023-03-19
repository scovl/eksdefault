terraform {
  backend "s3" {
    bucket = "generic-terraform-backend"
    key    = "generic/tfstate"
    region = "us-east-1"

    dynamodb_table = "generic-tf-lock"
    
  }
}