variable "ami_number" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "security_group_ids" {
  description = "The IDs of the security groups"
  type = list(string)
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

# variable "project_setup_script" {
#   description = "The path to the project setup script"
#   type        = string
# }

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
}



variable "type" {
  description = "connect protocal type"
  type        = string
}

variable "user_data" {
  description = "User script"
  type        = string
}

variable "username" {
  description = "The SSH user for the instance"
  type        = string
}


variable "private_key" {
  description = "The store Private key"
  type        = string
}

variable "volume_size" {
  description = "The size of the root volume in GB"
  type        = number
}

