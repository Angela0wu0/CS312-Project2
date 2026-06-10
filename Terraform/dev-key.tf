# Generate the RSA key
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# # create public key
# resource "aws_key_pair" "mc_server_key" {
#   key_name   = "mc-server-key"
#   public_key = tls_private_key.rsa_key.public_key_openssh
# }

# Save the private key into the proper folder
resource "local_sensitive_file" "mc_private_key" {
  content         = tls_private_key.rsa_key.private_key_pem
  filename        = "../Scripts/Key/mc-server-key"
  file_permission = "0600"
}


