variable "bucket_name" {
  description = "Terraform State Bucket Name"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Terraform Lock Table"
  type        = string
}
