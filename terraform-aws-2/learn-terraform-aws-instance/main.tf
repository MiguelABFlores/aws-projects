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
  # profile = "default"
  region = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "firstawstask" {
  ami           = "ami-0e4841c3bb7d47d69"
  instance_type = "t2.micro"
  subnet_id = "subnet-016f5b4ad1d69e474"
  tags = {
    Name = "Example4Enrique"
  }
}

{
    "Version": "2023-01-27",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:*",
            "Resource": "arn:aws:ec2:us-east-1:*:*"
        }
    ]
}

# resource "aws_key_pair" "Example4Enrique" {
#   key_name = "firstawstask_key"
#   public_key = "firstawstask_key"
# }

output "public_ip" {
  value = aws_instance.firstawstask.public_ip
}