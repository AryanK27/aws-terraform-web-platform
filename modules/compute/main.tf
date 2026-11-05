resource "aws_instance" "web"{
    instance_type=var.instance_type
    ami="ami-0f19324397f53458f"
     vpc_security_group_ids = [var.security_group_id]

    subnet_id = var.subnet_id
    user_data = var.user_data
    associate_public_ip_address = true
    metadata_options {
  http_endpoint = "enabled"
  http_tokens   = "required"
}
    tags={
        Name="${var.project_name}-${var.environment}-instance"
    }
}

