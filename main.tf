provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "Pipeline_created_Machine" {
  ami                    = "ami-0b45ae66668865cd6"
  instance_type          = "t2.micro"
  key_name               = "testkey"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "Node-Created-By-GitAction"
  }
}

#Create Security Group for the ec2_Node 

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}