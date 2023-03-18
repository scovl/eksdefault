data "aws_iam_policy_document" "eks_cluster_role" {
    version = "2012-10-17"

    statement {
        actions = [
            "sts:AssumeRole"
        ]

        principals {
            type = "Service"
            identifiers = [
                "eks.amazonaws.com", 
                "eks-fargate-pods.amazonaws.com"
            ]
        }
    effect = "Allow"
    }
}

resource "aws_iam_role" "eks_cluster_role" {
  name = format("%s-eks-cluster-role", var.cluster_name)
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_role.json
}

resource "aws_iam_role_policy_attachment" "eks-cluster-cluster" {
  count = length(var.eks_cluster_policies)

  policy_arn = "arn:aws:iam::aws:policy/${var.eks_cluster_policies[count.index]}"
  role = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_policy" "load_balancer_controller_policy" {
  name        = format("%s-load-balance-controller-policy", var.cluster_name)
  policy      = file("${path.module}/load_balancer_controller_policy.json")
}

resource "aws_iam_role_policy_attachment" "load_balancer_controller_policy" {
  policy_arn = aws_iam_policy.load_balancer_controller_policy.arn
  role       = aws_iam_role.eks_cluster_role.name
}