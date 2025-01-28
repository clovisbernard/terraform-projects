aws_region = "us-east-1"
# ami           = "ami-007855ac798b5175e"
instance_type = "t2.micro"
key_name      = "key-2024"
subnet_id     = "subnet-0d1a27dd65434c250"
common_tags = {
  "AssetID"       = "2024"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "Dev"
  "Environment"   = "Linux"
  "Project"       = "Training"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
