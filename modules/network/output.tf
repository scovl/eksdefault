output "cluster_vpc" {
  value = aws_vpc.cluster_vpc
}

output "cluster_vpc_id" {
  value = aws_vpc.cluster_vpc.id
}

output "cluster_vpc_cidr_block" {
  value = aws_vpc.cluster_vpc.cidr_block
}

output "cluster_vpc_default_security_group_id" {
  value = aws_vpc.cluster_vpc.default_security_group_id
}

output "cluster_vpc_dhcp_options_id" {
  value = aws_vpc.cluster_vpc.dhcp_options_id
}

output "cluster_vpc_instance_tenancy" {
  value = aws_vpc.cluster_vpc.instance_tenancy
}