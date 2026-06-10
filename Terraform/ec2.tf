resource "aws_instance" "minecraft" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_type
  key_name               = aws_key_pair.mc_server_key.key_name
  vpc_security_group_ids = [aws_security_group.mc-sg.id]
  ebs_optimized          = true
  tags = {
    Name  = "Automated-Minecraft-Server"
    Owner = "wuange"
  }
}