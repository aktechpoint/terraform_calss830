resource "aws_instance" "frontend" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.sub_priv1.id
    vpc_security_group_ids = [aws_security_group.frontend_sg.id]
    key_name = aws_key_pair.my_key.key_name
    user_data = file("${path.module}/userdata/frontend.sh")
    associate_public_ip_address = false
    tags = {
        Name = "frontend-instance"
    }
}
resource "aws_instance" "backend" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.sub_priv2.id
    vpc_security_group_ids = [aws_security_group.backend_sg.id]
    key_name = aws_key_pair.my_key.key_name
   user_data = file("${path.module}/userdata/backend.sh")
    associate_public_ip_address = false
    tags = {
        Name = "backend-instance"
    }
  
}

resource "aws_instance" "bastion" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.sub_pub1.id
    vpc_security_group_ids = [aws_security_group.monitoring_sg.id]
    key_name = aws_key_pair.my_key.key_name
    user_data = file("${path.module}/userdata/monitoring.sh")
    associate_public_ip_address = true
    tags = {
        Name = "monitoring-instance"
    }
}



resource "aws_key_pair" "my_key" {
  key_name   = "test-key"
  public_key = file("C:/Users/aktec/.ssh/id_ed25519.pub")
}