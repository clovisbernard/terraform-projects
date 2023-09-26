data "aws_vpc" "alpha-vpc" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-vpc"]
  }
}

data "aws_subnet" "apha-private-subnet1" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-private_subnet_1"]
  }
}

data "aws_subnet" "apha-private-subnet2" {
  filter {
    name   = "tag:Name"
    values = ["2560-dev-alpha-private_subnet_2"]
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


/* ## This is to restore from snapshot
data "aws_db_snapshot" "example_snapshot" {
  # db_snapshot_identifier = format("%sArtifactorySnapshot", var.common_tags["Project"])
  db_snapshot_identifier = "alphaartifactorysnapshot"
} */