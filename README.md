# AWS Infrastructure with Terraform

This repository contains Terraform configurations for setting up AWS infrastructure, including VPC, subnets, security groups, key pairs, and EC2 instances.

## Table of Contents

- [Description](#description)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Outputs](#outputs)
- [Contributing](#contributing)
- [License](#license)

## Description

The purpose of this project is to automate the provisioning of AWS infrastructure using Terraform. It includes the creation of a custom VPC with both public and private subnets, security groups for different types of traffic, key pairs for SSH access, and EC2 instances. This setup is ideal for deploying a web application that requires a secure and scalable network architecture.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html) (v1.6.3 or later)
- AWS CLI configured with appropriate IAM permissions
- An AWS account with access keys

## Setup

1. **Clone the repository:**

    ```bash
    git clone https://github.com/krishna2808/aws-infrastructure.git
    cd aws-infrastructure
    ```

2. **Initialize Terraform:**

    ```bash
    terraform init
    ```

3. **Create a `terraform.tfvars` file: or set environment in os**

    Create a `terraform.tfvars` file in the root directory with the following content:

    ```hcl
    AWS_ACCESS_KEY = "your_aws_access_key"
    AWS_SECRET_KEY = "your_aws_secret_key"
    ```

4. **Review and customize variables:**

    Review `variables.tf` to ensure the settings align with your requirements. Modify any necessary values.

## Usage

1. **Plan the infrastructure:**

    Generate and review the execution plan:

    ```bash
    terraform plan
    ```

2. **Apply the configuration:**

    Create the infrastructure:

    ```bash
    terraform apply
    ```

3. **Generate a graphical representation:**

    Generate and save the infrastructure graph as a PDF:

    ```bash
    terraform graph | dot -Tpdf > infrastructure.pdf
    ```
4. **Tree structure of repo**

         aws-infrastructure/
      ├── .gitignore <br>
      ├── graph.dot  <br>
      ├── graph.pdf   <br>
      ├── graph.png  <br>
      ├── main.tf  <br>
      ├── modules/  
      │   ├── ec2_instance/  <br>
      │   │   ├── main.tf   <br>
      │   │   ├── outputs.tf   <br>
      │   │   └── variables.tf   <br>
      │   ├── key_pair/     <br>
      │   │   ├── main.tf   <br>
      │   │   ├── outputs.tf   <br>
      │   │   └── variables.tf   <br>
      │   ├── security_group/   <br>
      │   │   ├── main.tf     <br>
      │   │   ├── outputs.tf   <br>
      │   │   └── variables.tf   <br>
      │   └── vpc/    <br>
      │       ├── main.tf   <br>
      │       ├── outputs.tf   <br>
      │       └── variables.tf   <br>
      ├── outputs.tf   <br>
      ├── README.md   <br>
      ├── terraform_commands.txt   <br>
      └── variables.tf   <br>

## Outputs

After applying the configuration, Terraform will output the relevant information such as:

- VPC ID
- Subnet IDs
- Security Group IDs
- Key Pair name
- EC2 instance details (public IP, private IP, etc.)

These outputs can be found in the `outputs.tf` file in each module.


## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements or bug fixes. Make sure to follow the existing coding style and include appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
