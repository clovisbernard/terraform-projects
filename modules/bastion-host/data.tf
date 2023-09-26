data "aws_vpc" "alpha-vpc" {
  filter {
    name   = "tag:Name"
<<<<<<< HEAD
    values = ["2560-dev-alpha-vpc"]
=======
    values = ["2023-dev-alpha-vpc"]
>>>>>>> 9b730721f32a74618d015157f838e4483fd93fe2
  }
}

data "aws_subnet" "public01" {
  filter {
    name   = "tag:Name"
<<<<<<< HEAD
    values = ["2560-dev-alpha-public_subnet_1"]
=======
    values = ["2023-dev-alpha-public_subnet_1"]
>>>>>>> 9b730721f32a74618d015157f838e4483fd93fe2
  }
}

data "aws_subnet" "public02" {
  filter {
    name   = "tag:Name"
<<<<<<< HEAD
    values = ["2560-dev-alpha-public_subnet_2"]
=======
    values = ["2023-dev-alpha-public_subnet_2"]
>>>>>>> 9b730721f32a74618d015157f838e4483fd93fe2
  }
}
