terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.54.0"
    }
  }
}




provider "aws" {
  region = var.regions
}

variable "regions"{
  type = string
  default = "ap-southeast-2"
}

resource "aws_vpc" "ProdVpc" {
  cidr_block       = var.CidrBlockVpc
  instance_tenancy = "default"

  tags = {
    Name = "VpcProd"
  }
}

resource "aws_subnet" "PublicSubnet" {
  vpc_id                  = aws_vpc.ProdVpc.id
  cidr_block              = var.SnPublic
  map_public_ip_on_launch = "true"

  tags = {
    Name = "SnA"
  }
}

resource "aws_subnet" "PrivateSubnet" {
  vpc_id     = aws_vpc.ProdVpc.id
  cidr_block = var.SnPrivate

  tags = {
    Name = "SnB"
  }
}

resource "aws_security_group" "sgBastion" {
  name        = "sgBastion"
  vpc_id      = aws_vpc.ProdVpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.AllTraffic]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "all"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sgEc2Host" {
  name   = "sgHost"
  vpc_id = aws_vpc.ProdVpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [join("", [aws_instance.BastionHost.private_ip, "/", "32"])]
  }
 
 egress {
    from_port       = 0
    to_port         = 0
    protocol        = "all"
    cidr_blocks     = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "BastionHost" {
  ami                    = var.Ami
  instance_type          = "t2.micro"
  key_name               = "Default"
  subnet_id              = aws_subnet.PublicSubnet.id
  vpc_security_group_ids = [aws_security_group.sgBastion.id]
  tags = {
    Name = "BastionHost"
  }
}

resource "aws_instance" "LinuxInstance" {
  ami                    = var.Ami
  instance_type          = "t2.micro"
  key_name               = "Default"
  subnet_id              = aws_subnet.PrivateSubnet.id
  vpc_security_group_ids = [aws_security_group.sgEc2Host.id]
  tags = {
    Name = "LinuxHost"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ProdVpc.id

  tags = {
    Name = "ProdIgw"
  }
}

resource "aws_route_table" "rtable" {
  vpc_id = aws_vpc.ProdVpc.id

 route {
      cidr_block = var.AllTraffic
      gateway_id = aws_internet_gateway.gw.id
    }

  tags = {
    Name = "ProdRT"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.ProdVpc.id
  route_table_id = aws_route_table.rtable.id
}

