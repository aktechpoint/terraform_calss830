provider "aws" {
  profile = "asmit"
}

terraform {
  required_version = ">=1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "classramalalasinghclass"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform-lock-old"
  }
}
resource "aws_instance" "name" {
 ami = "ami-01a00762f46d584a1"
 instance_type = "t3.micro"
 tags = {
   Name = "terraform-day-5-statefile"
 } 
}

