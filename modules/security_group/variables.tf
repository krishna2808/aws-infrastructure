variable "sg_name" {
  description = "The name of the security group"
  type        = string
}

variable "sg_description" {
  description = "The description of the security group"
  type        = string
}


variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "ssh_description" {
  description = "Description for SSH rule"
  type        = string
}

variable "ingress_from_port_ssh" {
  description = "Ingress from port for SSH"
  type        = number
}

variable "ingress_to_port_ssh" {
  description = "Ingress to port for SSH"
  type        = number
}

variable "ingress_protocol" {
  description = "Ingress protocol"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "Ingress CIDR blocks"
  type        = list(string)
}

variable "http_description" {
  description = "Description for HTTP rule"
  type        = string
}

variable "ingress_from_port_http" {
  description = "Ingress from port for HTTP"
  type        = number
}

variable "ingress_to_port_http" {
  description = "Ingress to port for HTTP"
  type        = number
}

variable "https_description" {
  description = "Description for HTTPS rule"
  type        = string
}

variable "ingress_from_port_https" {
  description = "Ingress from port for HTTPS"
  type        = number
}

variable "ingress_to_port_https" {
  description = "Ingress to port for HTTPS"
  type        = number
}

variable "custom_tcp_description" {
  description = "Description for custom TCP rule"
  type        = string
}

variable "ingress_from_port_custom_tcp" {
  description = "Ingress from port for custom TCP"
  type        = number
}

variable "ingress_to_port_custom_tcp" {
  description = "Ingress to port for custom TCP"
  type        = number
}

variable "allow_all_traffic_outbound_description" {
  description = "Description for outbound rule"
  type        = string
}

variable "egress_from_port" {
  description = "Egress from port"
  type        = number
}

variable "egress_to_port" {
  description = "Egress to port"
  type        = number
}

variable "egress_protocol" {
  description = "Egress protocol"
  type        = string
}

variable "egress_cidr_blocks" {
  description = "Egress CIDR blocks"
  type        = list(string)
}
