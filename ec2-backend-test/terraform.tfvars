aws_region = "us-east-1"
# ami           = "ami-007855ac798b5175e"
instance_type = "t2.micro"
key_name      = "key-11"
subnet_id     = "subnet-0d1a27dd65434c250"
common_tags = {
  "AssetID"       = "2500"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}
