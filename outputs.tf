
# Output the instance username and public IP address
output "ssh_command" {
  description = "SSH command to access the EC2 instance"
  value       = "ssh -i ${module.key_pair.filename} ${module.ec2_instance.instance_username}@${module.ec2_instance.public_ip}"
}