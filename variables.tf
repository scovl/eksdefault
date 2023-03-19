variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "k8s-generic-cluster"
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.20"
}

variable "nodes_instances_sizes" {
  description = "List of instance sizes to use for nodes"
  type        = list(string)
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  description = "Auto scale options"
  type        = map(number)
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}

variable "auto_scale_cpu" {
  description = "Auto scale CPU options"
  type        = map(number)
  default = {
    scale_up_threshold  = 80
    scale_up_period     = 60
    scale_up_evaluation = 2
    scale_up_cooldown   = 300
    scale_up_add        = 2

    scale_down_threshold  = 40
    scale_down_period     = 120
    scale_down_evaluation = 2
    scale_down_cooldown   = 300
    scale_down_remove     = -1
  }
}

variable "vpc_cidr_block" {
  description = "Bloco CIDR da VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr_blocks" {
  description = "Lista dos blocos CIDR das sub-redes privadas."
  type        = list(string)
  default     = ["10.0.32.0/20", "10.0.48.0/20"]
}

