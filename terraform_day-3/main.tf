resource "aws_instance" "vm" {
  ami = var.ami_data
  instance_type = "t3.micro"
  key_name = "asmit_abhi"
  tags = {
    Name = "jenkins_server"
  }
}
