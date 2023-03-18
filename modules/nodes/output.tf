output "eks_node_role_name" {
    value = aws_iam_role.eks_node_role.name
}

output "eks_node_role_arn" {
    value = aws_iam_role.eks_node_role.arn
}

output "eks_node_group_name" {
    value = aws_eks_node_group.cluster.node_group_name
}

output "eks_node_group_nodes" {
    value = aws_eks_node_group.cluster.scaling_config.desired_size
}