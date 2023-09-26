resource "aws_db_instance" "postgres" {
  identifier            = "example-postgres-db" 
  engine                = "postgres"            
  engine_version        = "13.4"                
  instance_class        = "db.t3.small"         
  allocated_storage     = 20                    
  max_allocated_storage = 100                    
  publicly_accessible   = false                 
  name                  = "artifactory"         
  username              = "exampleuser"         
  password              = "examplepassword"     
  skip_final_snapshot     = true
  backup_retention_period = 7      
  deletion_protection     = false 
  multi_az                    = false 
  allow_major_version_upgrade = false 
  auto_minor_version_upgrade  = true  
  parameter_group_name    = aws_db_parameter_group.postgres.name
  vpc_security_group_ids = [aws_security_group.postgres.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres.name

  tags = {
    Name = "example-postgres-db"
  }
}

resource "aws_security_group" "postgres" {
  name_prefix = "example-postgres-db-"
  vpc_id      = "vpc-0ee701990ff30ec3a"
}

resource "aws_security_group_rule" "postgres_ingress" {
  type        = "ingress"
  from_port   = 5432
  to_port     = 5432
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.postgres.id
}

resource "aws_security_group_rule" "postgres_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.postgres.id
}

resource "aws_db_subnet_group" "postgres" {
  name       = "example-postgres-subnet"
  subnet_ids = ["subnet-0e7c5796d8110b510", "subnet-01b6648a034a59d6d"] # Replace with your own subnet IDs
}

resource "aws_db_parameter_group" "postgres" {
  name   = "default-postgres12"
  family = "postgres13"
}