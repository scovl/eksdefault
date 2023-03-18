resource "aws_subnet" "public_subnet" {
  count = length(var.subnet_cidr_blocks)
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block                = var.subnet_cidr_blocks[count.index]
  map_public_ip_on_launch   = true
  availability_zone     = var.availability_zones[count.index]

  tags = {
      "Name" = format("%s-public-%s", var.cluster_name, substr("abcdefghijklmnopqrstuvwxyz", count.index, 1)),
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count = length(var.subnet_cidr_blocks)

  subnet_id = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.igw_route_table.id
}