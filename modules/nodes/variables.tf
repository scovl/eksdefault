variable "aws_region" {}
variable "cluster_name" {}
variable "k8s_version" {}
variable "eks_cluster" {}
variable "eks_cluster_sg" {}
variable "nodes_instances_sizes" {}
variable "auto_scale_options" {}
variable "auto_scale_cpu" {}

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