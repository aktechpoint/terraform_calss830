resource "aws_s3_bucket" "terraform_state_old" {
  bucket = "classramalalasinghclass"
  
  tags = {
    Name        = "terraform_state_old"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
  
}

resource "aws_s3_bucket_versioning" "terraform_state_old" {
  bucket = aws_s3_bucket.terraform_state_old.id
  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_old" {
#   bucket = aws_s3_bucket.terraform_state_old.id
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# resource "aws_s3_bucket_public_access_block" "terraform_state_old" {
#   bucket = aws_s3_bucket.terraform_state_old.id
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

resource "aws_dynamodb_table" "terraform_lock_old" {
  name         = "terraform-lock-old"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform_lock_old"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
  
}