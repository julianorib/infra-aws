resource "aws_key_pair" "main" {
  key_name   = var.tag-dono
  public_key = file("/home/julianorib/.ssh/id_rsa.pub")
}
