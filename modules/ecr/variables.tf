variable "use_ecr" {
  description = "Whether to create ECR repositories"
  type        = bool
  default     = true
}

variable "ecr_repos" {
  description = "List of ECR repositories to create"
  type        = list(string)
  default     = ["frontend", "backend"]
}
