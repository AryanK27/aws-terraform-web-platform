#create a private s3 bucket
resource "aws_s3_bucket" "s3bucket" {

    bucket = var.bucket_name  
}


#this block all public access
resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  
    bucket=aws_s3_bucket.s3bucket.id
    
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
  
}


#this will provide s3 bucket server side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.s3bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


#Enable bucket versioning

resource "aws_s3_bucket_versioning" "s3_versioning" {
    bucket = aws_s3_bucket.s3bucket.id

    versioning_configuration {
      status = "Enabled"
    }
  
}