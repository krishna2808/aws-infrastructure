# Create VPC with private and public subnet. 
# To create VPC 
resource "aws_vpc" "custom_vpc_tf" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}
# create 2 subnet private and public and  
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.custom_vpc_tf.id
  cidr_block = var.subnet_cidr_block_public
  availability_zone = var.public_availability_zone

  tags = {
    Name = var.public_subnet_name
  }
}

# To create two route table. private and public route table( it is association subnet and outter network. route table is interface between subnet and outter network(may be instance NAT other gatways.))
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.custom_vpc_tf.id
  tags = {
    Name = var.public_route_name
  }
}


# route table is association with subnet and route table.
resource "aws_route_table_association" "public_route_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.custom_vpc_tf.id

  tags = {
    Name = var.aws_internet_gateway_name
  }
}



# Attach the internet gateway to the route table
resource "aws_route" "route_association_internet_gateway" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"  # Route all traffic to the internet gateway
  gateway_id             = aws_internet_gateway.gw.id
}

