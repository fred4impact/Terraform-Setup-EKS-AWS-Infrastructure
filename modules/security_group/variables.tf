variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to create the security group in"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type        = list(map(string))
}

variable "egress_rules" {
  description = "List of egress rules"
  type        = list(map(string))
}
