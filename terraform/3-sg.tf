## Criar um Security Group de acesso Internet
resource "aws_security_group" "acesso-out-internet" {
  name        = "acesso-out-internet"
  description = "permite acesso out internet"
  vpc_id      = data.aws_vpc.default.id

  egress {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Criar um Security Group de acesso SSH
resource "aws_security_group" "acesso-in-ssh" {
  name        = "acesso-in-ssh"
  description = "permite acesso in ssh"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Criar um Security Group de acesso WEB
resource "aws_security_group" "acesso-in-web" {
  name        = "acesso-in-http"
  description = "permite acesso in web"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
