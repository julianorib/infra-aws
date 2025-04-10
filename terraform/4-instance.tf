## Criar a Instância Linux
resource "aws_instance" "linux" {
  ami             = data.aws_ami.amzn-linux-2023-ami.id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.main.key_name
  subnet_id       = data.aws_subnets.default.ids[0]
  security_groups = [aws_security_group.acesso-out-internet.id, aws_security_group.acesso-in-ssh.id, aws_security_group.acesso-in-web.id]
  iam_instance_profile = aws_iam_instance_profile.ec2-s3-profile.name

user_data = base64encode(templatefile("${path.module}/templates/user-data.tpl", {
    BUCKET = var.bucket_name,
    REGION = var.region
  }))

  tags = merge({ Name = format("%s-linux", var.project_name) }, local.common_tags)

}