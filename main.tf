resource "aws_security_group" "securitygroup" {
    name = "securitygroup"
    description =  "Allow TLS inbound traffic"
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }  
}

resource "aws_key_pair" "keypair" {
    key_name = "terraform-keypair"
    public_key = file("~/.ssh/id_ed25519.pub") #var.public_key_path)
}

resource "aws_instance" "instance" {
  ami           = "ami-0f3caa1cf4417e51b" #resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"
  user_data = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
  key_name = aws_key_pair.keypair.key_name
  tags = {
    Name = "HelloWorld"
  }
}
