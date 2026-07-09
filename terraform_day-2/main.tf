resource "aws_instance" "test" {
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    key_name = "rajaji"
    tags = {
        Name = "jenkins"
    }
  
}


resource "aws_s3_bucket" "test1" {
    bucket = "rajajibucketclasstest"
  
}
