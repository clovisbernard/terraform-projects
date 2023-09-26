variable "aws_region_main" {
  type = string
  default = "us-east-1"
}

variable "aws_region_backup" {
  type = string
  default = "us-east-2"
}

variable "env_type" {
  type        = string
  default = "development"
}

variable "project_name" {
  type        = string
  default = "alpha"
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "1000"
    "AssetName"     = "INFRA"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}
