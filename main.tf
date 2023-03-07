terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "talha-key" {
  key_name   = "talha-key"
  public_key = file("/root/.ssh/id_rsa.pub")
}
resource "aws_instance" "app_server" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.medium"
  key_name      = aws_key_pair.talha-key.key_name


  tags = {
    Name = "talhaornek"
  }
}

