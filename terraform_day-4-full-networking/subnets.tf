resource "aws_subnet" "sub_pub1" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.subnet1_cidr
    availability_zone = var.subnet1_az
    map_public_ip_on_launch = true
    tags = {
        Name = var.subnet1_name
    }
}
resource "aws_subnet" "sub_pub2" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.subnet2_cidr
    availability_zone = var.subnet2_az
    map_public_ip_on_launch = true
    tags = {
        Name = var.subnet2_name
    }
}

#private subnets
resource "aws_subnet" "sub_priv1" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.subnet3_cidr
    availability_zone = var.subnet3_az
    tags = {
        Name = var.subnet3_name
    }
}

resource "aws_subnet" "sub_priv2" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.subnet4_cidr
    availability_zone = var.subnet4_az
    tags = {
        Name = var.subnet4_name
    }
}

resource "aws_subnet" "sub_priv3" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.subnet5_cidr
    availability_zone = var.subnet5_az
    tags = {
        Name = var.subnet5_name
    }
  
}