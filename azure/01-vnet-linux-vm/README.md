# 01 - VNet and Linux VM

## Description

A virtual network in Azure with a single subnet, protected by a network security group, and a small Linux VM that can be reached over SSH from my own IP address only.

## Purpose

This is my first Azure project. The goal is to learn:

- The Terraform basics: the `azurerm` provider, state, and the `init` / `plan` / `apply` / `destroy` workflow
- Azure networking fundamentals: virtual networks, subnets and network security groups
- How resources depend on each other, and how Terraform works out the order to create them in
- Deploying a VM with SSH key authentication instead of a password

Later I want to build the same setup in AWS (VPC, subnet, security group, EC2) and compare the two.

## Architecture

The solution consists of:

| Resource | Purpose |
| --- | --- |
| Resource group | Container for all resources in the project |
| Virtual network + subnet | Private network the VM lives in |
| Network security group | Only allows inbound SSH (port 22) from my own public IP |
| Public IP + network interface | Connects the VM to the subnet and makes it reachable from the internet |
| Linux virtual machine | Small Ubuntu VM (`Standard_B1s`) with SSH key login |

See [`diagrams/`](diagrams/) for the architecture diagram.

## Deployment

**Prerequisites:** Azure CLI, Terraform, and an SSH key pair.

```bash
az login
cd terraform
terraform init
terraform plan
terraform apply
```

Connect to the VM:

```bash
ssh <admin-user>@<public-ip>
```

Tear everything down when done, so the VM and public IP don't keep costing money:

```bash
terraform destroy
```

## Lessons learned

_What did I learn? Which challenges did I run into, and what would I do differently?_
