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

data "aws_subnet" "apha-private-subnet1" {
  filter {
    name   = "tag:Name"
<<<<<<< HEAD
    values = ["2560-dev-alpha-private_subnet_1"]
=======
    values = ["2023-dev-alpha-private_subnet_1"]
>>>>>>> 9b730721f32a74618d015157f838e4483fd93fe2
  }
}

data "aws_subnet" "apha-private-subnet2" {
  filter {
    name   = "tag:Name"
<<<<<<< HEAD
    values = ["2560-dev-alpha-private_subnet_2"]
=======
    values = ["2023-dev-alpha-private_subnet_2"]
>>>>>>> 9b730721f32a74618d015157f838e4483fd93fe2
  }
}

# Get secret information for RDS password
data "aws_secretsmanager_secret" "rds_password" {
  name = format("%s-%s-artifactory-db-password", var.common_tags["Environment"], var.common_tags["Project"])
}
data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id
}

# Get secret information for RDS username
data "aws_secretsmanager_secret" "rds_username" {
  name = format("%s-%s-artifactory-db-username", var.common_tags["Environment"], var.common_tags["Project"])
}
data "aws_secretsmanager_secret_version" "rds_username" {
  secret_id = data.aws_secretsmanager_secret.rds_username.id
}