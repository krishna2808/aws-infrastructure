resource "aws_security_group" "security_group_tf" {
  description = var.sg_description
  vpc_id     = var.vpc_id

  tags = {
    Name = var.sg_name
  }
  # Define inbound rules
  ingress {
    description = var.ssh_description
    from_port   = var.ingress_from_port_ssh
    to_port     = var.ingress_to_port_ssh
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  ingress {
    description = var.https_description
    from_port   = var.ingress_from_port_https
    to_port     = var.ingress_from_port_https
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  ingress {
    description = var.http_description
    from_port   = var.ingress_from_port_http
    to_port     = var.ingress_from_port_http
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  ingress {
    description = "Allow ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.ingress_cidr_blocks
  }

  ingress {
    description = var.custom_tcp_description
    from_port   = var.ingress_from_port_custom_tcp
    to_port     = var.ingress_from_port_custom_tcp
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  // Define outbound rules (allow all traffic)
  egress {
    description = var.allow_all_traffic_outbound_description 
    from_port       = var.egress_from_port
    to_port         = var.egress_from_port
    protocol        = var.egress_protocol
    cidr_blocks     = var.egress_cidr_blocks
  }

}