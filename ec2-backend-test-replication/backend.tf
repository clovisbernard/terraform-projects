################### S3 as BACKEND ############################
terraform {
  backend "s3" {
    bucket         = "development-alpha-tf-state"
    key            = "state-test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "development-alpha-tf-state-lock"
  }
}