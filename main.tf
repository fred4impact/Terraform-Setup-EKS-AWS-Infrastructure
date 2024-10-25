provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

# Security Group
module "security_group" {
  source      = "./modules/security_group"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
}

# IAM
module "iam" {
  source = "./modules/iam"

  eks_cluster_role_name     = var.eks_cluster_role_name
  eks_node_group_role_name  = var.eks_node_group_role_name
}

# EKS Cluster
module "eks_cluster" {
  source                   = "./modules/eks"
  cluster_name             = var.cluster_name
  cluster_role_arn         = module.iam.eks_cluster_role_arn
  subnet_ids               = module.vpc.public_subnet_ids
  cluster_security_group_id = module.security_group.eks_cluster_security_group_id
}

# EKS Node Group
module "eks_node_group" {
  source                = "./modules/eks_node_group"
  cluster_name          = module.eks_cluster.cluster_id
  node_group_name       = var.node_group_name
  node_role_arn         = module.iam.eks_node_group_role_arn
  subnet_ids            = module.vpc.public_subnet_ids
  desired_size          = var.node_count
  max_size              = var.node_count + 2
  min_size              = var.node_count
  instance_types        = ["t2.large"]
  ec2_ssh_key           = var.ec2_ssh_key
  node_security_group_id = module.security_group.eks_node_security_group_id
}
