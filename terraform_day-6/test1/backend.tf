terraform {

#   backend "s3" {

#     bucket = "testingremotclass830abhi"

#     key = "dev/terraform.tfstate"

#     region = "ap-south-1"

#     encrypt = true

#     dynamodb_table = "testingremotclass830abhi-locks"

#     # If you're using the newer S3 lockfile feature instead,
#     # replace the line above with:
#     # use_lockfile = true
#   }

 backend "s3" {
    bucket         = "productservice-terraform-state-bucket-class"
    key            = "eks/infrastructure/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }

}