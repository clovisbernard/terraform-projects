locals {
aws_region = "us-east-1"
# ami           = "ami-007855ac798b5175e"
instance_type = "t2.micro"
key_name      = "key-1"
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

}

resource "aws_instance" "example" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = local.instance_type
  key_name               = local.key_name
  subnet_id              = local.subnet_id
  vpc_security_group_ids = [aws_security_group.example.id]
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }
  tags = merge(local.common_tags, {
    Name   = format("%s-%s-%s-bastion-host", local.common_tags["AssetID"], local.common_tags["Environment"], local.common_tags["Project"])
    },
  )
}


