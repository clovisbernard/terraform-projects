data "aws_vpc" "alpha-vpc" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-vpc"]
  }
}

data "aws_subnet" "private01" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-private_subnet_1"]
  }
}

data "aws_subnet" "private02" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-private_subnet_2"]
  }
}

data "aws_eks_cluster" "example" {
  name = format("%s-%s-%s", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
}

output "eks_cluster_name" {
  value = data.aws_eks_cluster.example.name
}
