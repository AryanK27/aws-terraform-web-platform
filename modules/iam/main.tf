resource "aws_iam_role" "ec2_role" {
    name = var.aws_role_name //givng IAM Role a Name

    assume_role_policy = jsonencode({
        Version="2012-10-17"


        Statement=[{
            Effect="Allow"


            Principal={
                Service="ec2.amazonaws.com"
            }
            Action="sts:AssumeRole"
        }]
    })
    tags = var.aws_tags_for_role
  
}


//This is the AWS IAM ROLE POLICY THIS WILL BE ATTACHED TO OUR IAM

resource "aws_iam_role_policy" "s3_read" {
  name = "${var.aws_role_name}-s3-read"
role=aws_iam_role.ec2_role.id

policy = jsonencode({
    Version="2012-10-17"

    Statement=[{
        Effect="Allow"

        Action=[
            "s3:GetObject"
        ]
        Resource="${var.bucket_arn}/${var.s3_object_prefix}*"
    }]
})
}


//THIS IS THE INSTANCE PROFILE

resource "aws_iam_instance_profile" "ec2_profile" {
    name = "${var.aws_role_name}-profile"
    role=aws_iam_role.ec2_role.name  //Associate created IAM Role

    tags=var.aws_tags_for_role
  
}