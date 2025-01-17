data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"

    values = ["2560-dev-alpha-vpc"]
# >>>>>>> 9b730721f32a74618d015157f838e4483fd93fe2
  }
}

data "aws_eks_cluster" "example" {
  name = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
}

data "aws_eks_cluster_auth" "example" {
  name = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
}

# Get AWS Account ID
data "aws_caller_identity" "current" {}
