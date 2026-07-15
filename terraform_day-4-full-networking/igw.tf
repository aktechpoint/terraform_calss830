resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpctest.id
  tags = {
    Name = "abhi_igw"
  }
  
}