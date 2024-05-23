output "vpc_id" {
  value = aws_vpc.custom_vpc_tf.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "igw_id" {
  value = aws_internet_gateway.gw.id
}
