
# Public instance 
resource "aws_instance" "public_instance_tf" {
  tags = {
    Name = var.instance_name
  }
  ami             = var.ami_number
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = var.security_group_ids
  key_name        = var.key_name
  associate_public_ip_address = true 

  # Define the root volume with 16GB size
  root_block_device {
    volume_size = var.volume_size
  }

  # Use remote-exec provisioner to update project setup from GitHub
  provisioner "remote-exec" {
    inline = [var.user_data]
    # inline = [file("./modules/ec2_instance/project_setup_script_without_docker_container.sh")]

    connection {
      type        = var.type
      user        = var.username # Update the user based on the AMI you're using
      private_key = var.private_key
      host        = self.public_ip  # Use the public IP of the instance
    }
  }
}

