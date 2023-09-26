aws_region    = "us-east-1"
instance_type = "t2.micro"
ami           = "ami-08edf43b1af1cde70"
key_name      = "key-1"
common_tags = {
  "AssetID"       = "2560"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
