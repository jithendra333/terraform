variable "s3_bucket_name" {
  description = "Name of the S3 bucket to store Terraform project files"
  type        = string
}

variable "path" {
  description = "Full path inside the S3 bucket (e.g., parent-folder/existing-subfolder/)"
  type        = string
}

