terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    key = "aws/ec2-deployment/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "server" {
  ami           = "ami-0a7d80731ae1b2435" # Replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.maingroup.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = var.private_key
    timeout     = "4m"
  }

  tags = {
    Name = "Deployment"
  }
}
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_instance_profile"
  role = "EC2-ECR-AUTH"
  
}

resource "aws_security_group" "name" {
  name        = "deployer-sg"
  description = "Security group for deployer instance"
  vpc_id      = "vpc-028b1a033958b5b0f" # Replace with your VPC ID

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "All outbound traffic"
    security_groups  = []
    self             = false
    prefix_list_ids  = []
    ipv6_cidr_blocks = []
  }

  ingress = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "SSH access"
      security_groups  = []
      self             = false
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "HTTP access"
      security_groups  = []
      self             = false
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
    }
  ]

  tags = {
    Name = "deployer-sg"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
}

output "instance_public_ip" {
  value = aws_instance.server.public_ip
  sensitive = true
}