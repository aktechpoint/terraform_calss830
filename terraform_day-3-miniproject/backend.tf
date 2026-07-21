terraform   {
  backend "s3" {
    bucket = "classramalalasinghclass"
    key    = "terraform-day-3-miniproject/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform_lock_old"
  }
}