terraform {
  backend "s3" {
    bucket = "clo835-s3"                      // Bucket where to SAVE Terraform State
    key    = "02-computing/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                      // Region where bucket is created
  }
}