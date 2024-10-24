output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "eks_instance_profile_name" {
  value = aws_iam_instance_profile.eks_instance_profile.name
}
