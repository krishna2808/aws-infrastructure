variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}


variable "public_availability_zone" {
  description = "public_availability zone"
  type        = string
}

variable "subnet_cidr_block_public" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "public_subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "public_route_name" {
  description = "The name of the router name"
  type        = string
}

variable "aws_internet_gateway_name" {
  description = "The name of internet gateway"
  type        = string
}

