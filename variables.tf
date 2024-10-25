# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"  # Update to your preferred AWS region
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Update based on your network design
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]  # Update with your subnet CIDRs
}

# EKS Cluster Configuration
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"  # Update based on your cluster naming convention
}

variable "cluster_version" {
  description = "EKS Cluster version"
  type        = string
  default     = "1.21"  # Specify the desired Kubernetes version
}

variable "node_instance_type" {
  description = "Instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"  # Adjust based on your workload requirements
}

variable "node_count" {
  description = "Desired number of worker nodes in the EKS cluster"
  type        = number
  default     = 3  # Adjust based on your needs
}

# EC2 Key Pair for SSH Access
# variable "key_pair_name" {
#   description = "EC2 Key Pair name for SSH access to worker nodes"
#   type        = string
# }

# Subnets and VPC ID
variable "vpc_id" {
  description = "ID of the VPC where the EKS cluster is deployed"
  type        = string
}

variable "enabled_cluster_log_types" {
  description = "List of cluster log types to enable"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "eks_cluster_role_name" {
  type        = string
  description = "Name of the EKS cluster IAM role"
}

variable "eks_node_group_role_name" {
  type        = string
  description = "Name of the IAM role for EKS node group"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "ec2_ssh_key" {
  description = "SSH key name for accessing EKS nodes"
  type        = string
}

variable "instance_types" {
  description = "Instance types for nodes in the node group"
  type        = list(string)
}
