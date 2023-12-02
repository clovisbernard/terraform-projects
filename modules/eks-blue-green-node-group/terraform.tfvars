aws_region = "us-east-1"

common_tags = {
  "AssetID"       = "2526"
  "AssetName"     = "Insfrastructure"
  "Teams"         = "DEL"
  "Environment"   = "dev"
  "Project"       = "alpha"
  "CreateBy"      = "Terraform"
  "cloudProvider" = "aws"
}

eks_version  = "1.28"
node_min     = "1"
desired_node = "1"
node_max     = "6"

blue_node_color  = "blue"
green_node_color = "green"

blue  = true
green = false

ec2_ssh_key               = "clo-key"
deployment_nodegroup      = "blue_green"
capacity_type             = "ON_DEMAND"
ami_type                  = "AL2_x86_64"
instance_types            = "t2.medium"
disk_size                 = "10"
shared_owned              = "shared"
enable_cluster_autoscaler = "true"
