terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.53.0"
    }
  }
}

provider "aws" {
  
}

resource "aws_instance" "jenkins"{
  ami = "ami-01a00762f46d584a1"
  instance_type="t3.micro"
  key_name = "rajaji"
  tags = {
    Name = "jenkins_server"
  }
}