#Output s3 Bucket name

output "bucket_name" {
    value = aws_s3_bucket.s3bucket.bucket 
  
}

#Output s3 bucket ARN

output "bucket_arn" {
    value = aws_s3_bucket.s3bucket.arn
  
}