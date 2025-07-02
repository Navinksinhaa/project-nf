terraform {
  required_version = ">= 1.2.0"
  backend "s3" {
    bucket = "pharma-lab-tfstate"
    key    = "staging/terraform.tfstate"
    region = "us-east-1"
  }
}

module "vpc" {
  source              = "../../modules/vpc"
  name                = "pharma-lab-vpc-staging"
  cidr                = "10.1.0.0/16"
  public_subnet_count = 2
  azs                 = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source           = "../../modules/eks"
  cluster_name     = "pharma-lab-eks-staging"
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.public_subnet_ids
  desired_capacity = 3
}

module "ecr" {
  source = "../../modules/ecr"
  repos  = ["urp", "alex", "raven"]
}

module "rds" {
  source   = "../../modules/rds"
  db_name  = "pharma_db_staging"
  username = "admin"
  password = "pharma5678"
}

module "secrets" {
  source      = "../../modules/secrets"
  secret_name = "pharma-lab-db-secret-staging"
  secret_data = {
    db_username = "admin"
    db_password = "pharma5678"
  }
}

resource "aws_cloudwatch_metric_alarm" "high_pod_cpu" {
  alarm_name          = "HighPodCPUStaging"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "pod_cpu_utilization"
  namespace           = "ContainerInsights"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_actions       = [aws_sns_topic.alerts.arn]
}
