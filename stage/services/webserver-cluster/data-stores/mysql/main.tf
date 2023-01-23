provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-up-and-running-state-misha"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 10
  db_name = "example_database"
  username = "admin"

  # How should we set the password?
  password = var.db_password
}

#data "aws_secretsmanager_secret_version" "db_password" {
# secret_id = "mysql-master-password-stage"
#}
