resource "aws_ecr_repository" "repos" {
  count = var.use_ecr ? length(var.ecr_repos) : 0
  name  = var.ecr_repos[count.index]
}
