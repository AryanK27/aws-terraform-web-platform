variable "aws_role_name" {
    type = string
  
}

variable "aws_tags_for_role" {
  description = "Tags for IAM resources"
  type        = map(string)

  default = {
    Name = "awsrole"
  }
}


variable "s3_object_prefix" {
    type = string
    default = "app/"
  
}

variable "bucket_arn" {
    type = string
  
}