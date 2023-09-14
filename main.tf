provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "my-dev"{
  count = 3
    ami = "ami-0af6e9042ea5a4e3e"
    instance_type = "t2.micro"
    key_name = "terraform-aws"

    tags = {
        Name        = "dev${count.index}"
    }
    vpc_security_group_ids = ["sg-0d00a3f968815f698"]
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["179.175.60.221/32"]
  }
  tags = {
    Name = "ssh"
  }
}