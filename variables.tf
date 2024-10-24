# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

# EKS Configuration
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_node_instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
}

variable "eks_node_count" {
  description = "Number of worker nodes in the EKS cluster"
  type        = number
}

# AWS Region
variable "aws_region" {
  description = "AWS region"
  type        = string
}

# EC2 Key Pair
variable "key_pair_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}

# ECR Configuration (Optional)
variable "use_ecr" {
  description = "Whether to create ECR repositories"
  type        = bool
}

variable "ecr_repos" {
  description = "List of ECR repositories to create"
  type        = list(string)
}
