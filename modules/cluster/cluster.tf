resource "aws_eks_cluster" "eks_cluster" {
  name        = var.cluster_name
  version = var.k8s_version
  role_arn    = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = concat(var.private_subnet_1a, var.private_subnet_1c)
    security_group_ids = [aws_security_group.cluster_sg.id]
  }

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}