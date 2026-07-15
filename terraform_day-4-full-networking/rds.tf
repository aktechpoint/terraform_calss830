resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql-subnet-group"
  subnet_ids = [aws_subnet.sub_priv1.id, aws_subnet.sub_priv2.id, aws_subnet.sub_priv3.id]

  tags = {
    Name = "mysql-subnet-group"
  }
  
}

resource "aws_security_group" "mysql_sg" {
  name        = "mysql-sg"
  description = "Security group for MySQL RDS instance"
  vpc_id      = aws_vpc.vpctest.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
    Name = "mysql-sg"
    }
}


resource "aws_db_instance" "testing_db" {
    identifier = "testing-db"
    engine = "mysql"
    instance_class = "db.t3.micro"
    allocated_storage = 20
    storage_type = "gp2"
    username = var.db_username
    password = var.db_password
    db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
    db_name = var.db_name
    vpc_security_group_ids = [aws_security_group.mysql_sg.id]
    multi_az = false
    publicly_accessible = false
    skip_final_snapshot = true
    deletion_protection = false
    tags = {
        Name = "abhi-db"
    }
  
}
