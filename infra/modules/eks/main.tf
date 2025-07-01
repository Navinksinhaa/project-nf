module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  node_groups = {
    default = {
      desired_capacity = var.desired_capacity
      max_capacity     = 5
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }
}

output "cluster_name" {
  value = module.eks.cluster_name
}
