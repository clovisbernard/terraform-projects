# provider blocks
provider "aws" {
  region = local.aws_region
}

# terraform blocks
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "2560-clovis-s4-state"
    dynamodb_table = "2560-clovis-s4-state-lock"
    key            = "eks-nodegroup/terraform.tfstate"
    region         = "us-east-1"
  }
}
locals {
  aws_region           = "us-east-1"
  desired_size         = "1"
  min_size             = "1"
  max_size             = "10"
  ec2_ssh_key          = "clo-key"
  ami_type             = "AL2_x86_64"
  capacity_type        = "ON_DEMAND"
  disk_size            = "20"
  force_update_version = false
  instance_types       = ["t2.medium", "t2.medium"]
  eks-version          = "1.28"
  label_name           = "guru"


  common_tags = {
    "AssetID"       = "2526"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
  
}

module "vpc" {
  source               = "../../../modules/eks-node-group"
  aws_region           = local.aws_region
  common_tags          = local.common_tags
  desired_size         = local.desired_size
  min_size             = local.min_size
  max_size             = local.max_size
  label_name           = local.label_name
  ec2_ssh_key          = local.ec2_ssh_key
  ami_type             = local.ami_type
  capacity_type        = local.capacity_type
  disk_size            = local.disk_size
  force_update_version = local.force_update_version
  instance_types       = local.instance_types
  eks-version          = local.eks-version
}
