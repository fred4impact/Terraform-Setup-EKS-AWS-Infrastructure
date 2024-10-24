provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "eks" {
  source = "./modules/eks"

  cluster_name        = var.eks_cluster_name
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.public_subnet_ids
  node_instance_type  = var.eks_node_instance_type
  node_count          = var.eks_node_count
  key_pair_name       = var.key_pair_name
}

module "ecr" {
  source = "./modules/ecr"
  use_ecr = var.use_ecr
  ecr_repos = var.ecr_repos
}

module "iam" {
  source = "./modules/iam"
}
