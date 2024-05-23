output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.security_group_tf.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.security_group_tf.name
}

output "ingress_rules" {
  description = "The ingress rules of the security group"
  value       = aws_security_group.security_group_tf.ingress
}

output "egress_rules" {
  description = "The egress rules of the security group"
  value       = aws_security_group.security_group_tf.egress
}
