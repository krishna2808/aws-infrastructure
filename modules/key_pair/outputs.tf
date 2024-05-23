output "filename" {
  description = "This is key pair name"
  value       = local_file.private_key.filename
}

output "key_name" {
  description = "This is key pair name"
  value       = aws_key_pair.key_pair_tf.key_name
}

output "generated_private_key" {
  description = "Private key from key-pair"
  value       = tls_private_key.key_pair_public_private.private_key_pem
}
