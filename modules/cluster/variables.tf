variable "aws_region" {}
variable "cluster_name" {}
variable "k8s_version" {}

variable "cluster_vpc" {
    description = "VPC na qual os Security Groups serão criados."
    type = object({
    id = string })
    default = null
}

variable "eks_cluster_policies" {
    description = "Lista de nomes das políticas de EKS para anexar ao papel"
    type = list(string)
    default = ["AmazonEKSClusterPolicy"]
}

variable "private_subnet_1a" {
  description = "ID da subnet privada na AZ A."
  type = list(string)
  default = []
}

variable "private_subnet_1c" {
  description = "ID da subnet privada na AZ C."
  type = list(string)
  default = []
}