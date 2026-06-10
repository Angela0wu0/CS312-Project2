output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.minecraft.id
}

output "ami_id" {
  description = "AMI ID"
  value       = aws_instance.minecraft.ami
}

output "security_group_id" {
  description = "SG ID"
  value       = aws_security_group.mc-sg.id
}

output "mc_public_ip" {
  description = "Minecraft Server Public IP"
  value       = aws_instance.minecraft.public_ip
}

output "public_key_openssh" {
  value = tls_private_key.rsa_key.public_key_openssh
}

output "private_key_pem" {
  value     = tls_private_key.rsa_key.private_key_pem
  sensitive = true

}