vpc_cidr_block = "10.0.0.0/16"
region = "us-east-1"

  subnets_cidr_block = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.20.0/24",
    "10.0.21.0/24",
  ]

    availability_zone = [
    "us-east-1a",
    "us-east-1b",
  ]