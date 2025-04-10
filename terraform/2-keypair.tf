## Criar uma Key Pair
resource "aws_key_pair" "main" {
  key_name   = "main"
  public_key = file("id_rsa.pub")

  tags = merge({ Name = format("%s-sshkey", var.project_name) }, local.common_tags)
}
