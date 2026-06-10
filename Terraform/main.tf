terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.41.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.9.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "local_file" "variables" {
  filename = "../Scripts/config.env"
  content  = <<EOT
PUBLIC_IP='${aws_instance.minecraft.public_ip}'
INSTANCE_ID='${aws_instance.minecraft.id}'
  EOT
}
