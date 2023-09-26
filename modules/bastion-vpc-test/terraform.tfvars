aws_region = "us-east-1"
ami           = "ami-062ab1d89961a36e0"
vpc_id        = "vpc-06b4b99b562386fe6"
instance_type = "t2.micro"
key_name      = "key-1"
subnet_id     = "subnet-0bbe48779d7a6bbfb"
common_tags = {
  "AssetID"       = "2500"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}