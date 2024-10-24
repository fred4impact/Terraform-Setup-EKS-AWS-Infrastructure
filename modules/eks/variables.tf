variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "node_instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
  default     = "t2.micro"
}

variable "node_count" {
  description = "Number of worker nodes in the EKS cluster"
  type        = number
  default     = 3
}

variable "key_pair_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}
