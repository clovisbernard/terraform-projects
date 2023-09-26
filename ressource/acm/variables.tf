variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "domain_name" {
  type    = string
  default = "tclovis.com"
}

variable "subject_alternative_names" {
  type    = string
  default = "*.tclovis.com"
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "2560"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreatedBy"     = "Terraform"
    "Cloudprovider" = "aws"
  }
}
