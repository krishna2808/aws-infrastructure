
# Generate a new RSA key pair
resource "tls_private_key" "key_pair_public_private" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

# Use the generated public key to create an AWS key pair
resource "aws_key_pair" "key_pair_tf" {
  key_name   = var.key_name  # Change to your desired key pair name
  public_key = tls_private_key.key_pair_public_private.public_key_openssh
}


# Output the private key to a file
resource "local_file" "private_key" {
  filename = var.filename
  content  = tls_private_key.key_pair_public_private.private_key_pem
}


# Change file permissions using local-exec provisioner
resource "null_resource" "set_permissions" {
  provisioner "local-exec" {
    command = "chmod 400 ${local_file.private_key.filename}"
  }

  triggers = {
    filename = var.filename
  }
}
