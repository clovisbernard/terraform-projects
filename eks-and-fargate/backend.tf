# backend blocks
terraform {
  backend "s3" {
    bucket         = "2560-clovis-s4-state"
    dynamodb_table = "2560-clovis-s4-state-lock"
    key            = "eks-fargate/terraform.tfstate"
    region         = "us-east-1"
  }
}
