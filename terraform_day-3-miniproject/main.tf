resource "aws_instance" "testsite" {
  ami = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  key_name = "asmit_abhi"
  user_data_base64 = filebase64("${path.module}/datainstall.sh")
  tags = {
    Name = "nginx_server"
  }
}