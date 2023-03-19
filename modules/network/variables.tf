variable "cluster_name" {}
variable "aws_region" {}

variable "subnet_cidr_blocks" {
  description = "Lista dos blocos CIDR das sub-redes públicas."
  type        = list(string)
  default     = ["10.0.32.0/20", "10.0.48.0/20"]
}

variable "availability_zones" {
  description = "Lista das zonas de disponibilidade onde as sub-redes serão criadas."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1c"]
}

variable "region_names" {
  description = "Lista com os nomes das regiões."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1c"]
}

variable "vpc_cidr_block" {}
variable "private_subnet_cidr_blocks" {}
