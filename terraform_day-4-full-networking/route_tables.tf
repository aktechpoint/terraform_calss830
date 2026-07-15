resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpctest.id
  tags = {
    Name = "public_route_table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet1_association" {
  subnet_id      = aws_subnet.sub_pub1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_subnet2_association" {
  subnet_id      = aws_subnet.sub_pub2.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpctest.id
  tags = {
    Name = "private_route_table"
  }
  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
}

resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.sub_priv1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.sub_priv2.id
  route_table_id = aws_route_table.private_route_table.id
  
}

resource "aws_route_table_association" "private_subnet3_association" {
  subnet_id      = aws_subnet.sub_priv3.id
  route_table_id = aws_route_table.private_route_table.id
  
}


