output "instance_username" {
  description = "Get public username from instance "
  value       = var.username
}


output "public_ip" {
  description = "Get public ip address from instance "
  value       = aws_instance.public_instance_tf.public_ip
}


