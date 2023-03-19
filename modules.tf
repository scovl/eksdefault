module "cluster" {
  source       = "./modules/cluster"
  cluster_name = var.cluster_name
  aws_region   = var.aws_region
  k8s_version  = var.k8s_version
}

module "nodes" {
  source = "./modules/nodes"

  cluster_name = var.cluster_name
  aws_region   = var.aws_region
  k8s_version  = var.k8s_version

  eks_cluster    = module.cluster.eks_cluster
  eks_cluster_sg = module.cluster.security_group

  nodes_instances_sizes = var.nodes_instances_sizes
  auto_scale_options    = var.auto_scale_options

  auto_scale_cpu = var.auto_scale_cpu
}

module "network" {
  source       = "./modules/network"
  cluster_name = var.cluster_name
  aws_region   = var.aws_region

  vpc_cidr_block             = var.vpc_cidr_block
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}