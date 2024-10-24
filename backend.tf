terraform {
  backend "s3" {
    bucket         = "eks-terraform-state-bucket1"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
