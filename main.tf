terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.50.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  required_version = ">= 1.6.3"
}



provider "aws" {
  region = "ap-south-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRETE_KEY

}

module "vpc" {
  source = "./modules/vpc"
  cidr_block       = "192.168.0.0/16"
  vpc_name         = "custom_vpc_tf"
  subnet_cidr_block_public = "192.168.1.0/24"
  public_availability_zone = "ap-south-1a"
  public_subnet_name = "public-subnet"
  public_route_name =  "public-route table"
  aws_internet_gateway_name = "custom-internet-gw-tf"
  
}

module "security_group" {
  source = "./modules/security_group"

  sg_name              = "security group tf"
  sg_description       = "security group is created by terraform"
  vpc_id               = module.vpc.vpc_id

  ssh_description = "Allow SSH"
  ingress_from_port_ssh    = 22
  ingress_to_port_ssh      = 22

  ingress_protocol     = "tcp"
  ingress_cidr_blocks  = ["0.0.0.0/0"]

  http_description = "Allow HTTP"
  ingress_from_port_http    = 80
  ingress_to_port_http      = 80

  https_description = "Allow HTTPS"
  ingress_from_port_https   = 443
  ingress_to_port_https      = 443

  custom_tcp_description = "Allow custom TCP port 8000"
  ingress_from_port_custom_tcp    = 8000
  ingress_to_port_custom_tcp      = 8000

  allow_all_traffic_outbound_description = "Allow ALL TRAFFIC OUTBOUND RULES"
  egress_from_port     = 0
  egress_to_port       = 0
  egress_protocol      = "-1"
  egress_cidr_blocks   = ["0.0.0.0/0"]
}

module "key_pair" {
  source = "./modules/key_pair"

  key_name   = "custom_key_pair_tf"
#   public_key = "your-public-key-material"
  algorithm = "RSA"
  rsa_bits = 2048
  filename = "private_key.pem"

}


module "ec2_instance" {
  source               = "./modules/ec2_instance"
  instance_name        = "Public Instance"
  ami_number           = "ami-0f58b397bc5c1f2e8" 
  instance_type        = "t2.micro"
  username             = "ubuntu"
  type                 = "ssh"
  volume_size          = 8
  # any module get value from outputs.tf. we can't get value from any resource we need to define outputs.tf variable.
  # key_name is not module.key_pair.key_name but it is key_pair module define get value key_name from outputs.tf and it is store. we need to define outputs.tf in key_pair module. 
  key_name             = module.key_pair.key_name
  # it is also get access outputs.tf from security_group module. 
  private_key          = module.key_pair.generated_private_key
  security_group_ids   = [module.security_group.security_group_id]
  user_data            = file("./modules/ec2_instance/project_setup_script_without_docker_container.sh")
  subnet_id            = module.vpc.subnet_id
}  


