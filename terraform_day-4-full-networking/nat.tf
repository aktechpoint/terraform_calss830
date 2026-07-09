resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "abhi_nat_eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet1.id
  tags = {
    Name = "abhi_nat_gw"
  }
  depends_on = [aws_internet_gateway.igw]
}