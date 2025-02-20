# Upload all files from the root project folder
resource "aws_s3_object" "terraform_s3_bucket" {
  for_each = setsubtract(
    fileset("${path.module}/../s3", "**"), # Get all files & folders
    tolist(
      concat(
        tolist(fileset("${path.module}/../s3/upload_object_new_s3_bucket/", ".terraform/**")),     # Exclude .terraform folder
        tolist(fileset("${path.module}/../s3/upload_object_new_s3_bucket/", ".*")),                # Exclude other hidden files
        tolist(fileset("${path.module}/../s3/upload_object_new_s3_bucket/", "terraform.tfstate*")) # Exclude Terraform state files
      )
    )
  )

  bucket = var.s3_bucket_name
  key    = "s3/${each.value}"
  source = "${path.module}/../s3/${each.value}"
  etag   = filemd5("${path.module}/../s3/${each.value}")
}
