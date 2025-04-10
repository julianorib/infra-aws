## Obter as AZ disponiveis
data "aws_availability_zones" "available" {}

## Obter a VPC Default 
data "aws_vpc" "default" {}

## Obter as Subnets Default
data "aws_subnets" "default" {}
