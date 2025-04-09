
resource "aws_iam_role" "ec2-s3" {
  name = format("%s-ec2-s3-role", var.project_name) 
  assume_role_policy = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}    
    )
      tags = merge({ Name = format("%s-ec2-s3-role", var.project_name) }, local.common_tags)
}


resource "aws_iam_role_policy" "ec2-s3-policy" {
  name = format("%s-ec2-s3-policy", var.project_name) 
  role = aws_iam_role.ec2-s3.id
 policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Action": [
            "s3:ListBucket",
            "s3:GetObject",
        ],
        "Resource": [
            "arn:aws:s3:::${var.bucket_name}",
            "arn:aws:s3:::${var.bucket_name}/*"
        ]
    }]
}) 

}

resource "aws_iam_instance_profile" "ec2-s3-profile" {
  name = format("%s-ec2-s3-instance-profile", var.project_name) 
  role = aws_iam_role.ec2-s3.name

        tags = merge({ Name = format("%s-ec2-s3-instance-profile", var.project_name) }, local.common_tags)
}