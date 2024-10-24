provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  instance_name   = "my-ec2-instance"
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  key_pair_name   = var.ec2_key_pair_name
  subnet_id       = element(module.vpc.public_subnet_ids, 0)
  vpc_id          = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
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
