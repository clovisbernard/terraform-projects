source "amazon-ebs" "amazon_linux" {
  ami_name      = "packer-amazon-linux-aws-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-1"

  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-2.0.2023*-x86_64-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }

  ssh_username = "ec2-user"
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.amazon_linux"
  ]
}