terraform {
  required_version = ">= 1.2.0"
  backend "s3" {
    bucket = "pharma-lab-tfstate"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source              = "../../modules/vpc"
  name                = "pharma-lab-vpc-dev"
  cidr                = "10.0.0.0/16"
  public_subnet_count = 2
  azs                 = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "pharma-lab-eks-dev"
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.public_subnet_ids
  desired_capacity = 2
}

module "ecr" {
  source = "../../modules/ecr"
  repos  = ["urp", "alex", "raven"]
}

module "rds" {
  source   = "../../modules/rds"
  db_name  = "pharma_db"
  username = "admin"
  password = "pharma1234"
}

module "secrets" {
  source      = "../../modules/secrets"
  secret_name = "pharma-lab-db-secret"
  secret_data = {
    db_username = "admin"
    db_password = "pharma1234"
  }
}
