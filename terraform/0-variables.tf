variable "project_name" {
  type        = string
  description = "Nome do projeto"
  default     = "Exemplo"
}

variable "tag-dono" {
  type        = string
  description = "Dono do projeto"
  default     = "Dono"
}

variable "tag-ambiente" {
  type        = string
  description = "Ambiente do projeto"
  default     = "Testes"
}

variable "tag-ccusto" {
  type        = string
  description = "Centro de Custo do projeto"
  default     = "Tecnologia"
}

variable "instance_type" {
  type        = string
  description = "Tipo de Maquina Virtual"
  default     = "t2.micro"
}

variable "region" {
  type        = string
  description = "Região dos Recursos"
  default     = "us-east-2"
}


variable "bucket_name" {
  type        = string
  description = "Nome do Bucket"
}