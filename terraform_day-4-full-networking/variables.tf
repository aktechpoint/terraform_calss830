variable "aws_profile" {
    description = "The AWS profile to use for authentication"
    type        = string  
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}
variable "vpc_name" {
    description = "The name of the VPC"
    type        = string
    default     = "abhi_vpc"
}
variable "subnet1_cidr" {
    description = "The CIDR block for the first public subnet"
    type        = string
    default     = "10.0.0.0/24"
}
variable "subnet1_az" {
    description = "The availability zone for the first public subnet"
    type        = string
    default     = "ap-south-1a"
}
variable "subnet1_name" {
    description = "The name of the first public subnet"
    type        = string
    default     = "abhi_subnet1"
}
variable "subnet2_cidr" {
    description = "The CIDR block for the second public subnet"
    type        = string
    default     = "10.0.1.0/24"
}
variable "subnet2_az" {
    description = "The availability zone for the second public subnet"
    type        = string
    default     = "ap-south-1b"
}   
variable "subnet2_name" {
    description = "The name of the second public subnet"
    type        = string
    default     = "abhi_subnet2"
}
variable "subnet3_cidr" {
    description = "The CIDR block for the first private subnet"
    type        = string
    default     = "10.0.2.0/24"
}
variable "subnet3_az" {
    description = "The availability zone for the first private subnet"
    type        = string
    default     = "ap-south-1a"
}
variable "subnet3_name" {
    description = "The name of the first private subnet"
    type        = string
    default     = "abhi_subnet3"
}

variable "subnet4_cidr" {
    description = "The CIDR block for the second private subnet"
    type        = string
    default     = "10.0.3.0/24"
}
variable "subnet4_az" {
    description = "The availability zone for the second private subnet"
    type        = string
    default     = "ap-south-1b"
}
variable "subnet4_name" {
    description = "The name of the second private subnet"
    type        = string
    default     = "abhi_subnet4"
}
variable "subnet5_cidr" {
    description = "The CIDR block for the third private subnet"
    type        = string
    default     = "10.0.4.0/24"
}
variable "subnet5_az" { 
    description = "The availability zone for the third private subnet"
    type        = string
    default     = "ap-south-1b"
}   
variable "subnet5_name" {
    description = "The name of the third private subnet"
    type        = string
    default     = "abhi_subnet5"
  
}

variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instances"
    type        = string
    default     = "ami-01a00762f46d584a1" # Replace with your desired AMI ID
}
variable "instance_type" {
    description = "The type of EC2 instance to launch"
    type        = string
    default     = "t3.micro"
}

variable "db_username" {
    description = "The username for the RDS database"
    type        = string
    default     = "admin"
}
variable "db_password" {
    description = "The password for the RDS database"
    type        = string
    default     = "Admin#$1234"
}

variable "db_name" {
    description = "The name of the RDS database"
    type        = string
    default     = "hidb"
}