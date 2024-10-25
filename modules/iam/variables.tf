variable "eks_cluster_role_name" {
  type        = string
  description = "Name of the EKS cluster IAM role"
}

variable "eks_node_group_role_name" {
  type        = string
  description = "Name of the IAM role for EKS node group"
}
