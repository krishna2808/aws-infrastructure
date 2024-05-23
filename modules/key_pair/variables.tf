variable "key_name" {
  description = "The name of the key pair to create in AWS"
  type        = string
  default     = "key-pair-tf"  
}


variable "algorithm" {
  description = "To Create key-pair using algorithm"
  type        = string
  default     = "RSA"  
}



variable "rsa_bits" {
  description = "To Create key-pair using rsa_bits"
  type        = number
  default     = 2048
}

variable "filename" {
  description = "The name of private key"
  type        = string
  default     = "private_key.pem"  
}

