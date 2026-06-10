data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "mc-sg" {
  name        = "mc-server-sg"
  description = "Allow SSH, and TCP for Minecraft Connections"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "TCP"
  }

  ingress {
    from_port   = 19132
    to_port     = 19133
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name  = "mc-server-sg"
    Owner = "wuange"
  }
}