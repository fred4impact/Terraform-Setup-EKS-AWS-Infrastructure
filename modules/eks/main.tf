module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.21"
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.node_count
      max_capacity     = var.node_count + 2
      min_capacity     = 1
      instance_type    = var.node_instance_type
      key_name         = var.key_pair_name
    }
  }
}
