# homelab

This repository contains all projects connected to my cloud "homelab", where I practice cloud concepts and Infrastructure as Code.
It is a continuous work in progress where I document everything I learn along the way.

## Purpose

I learn Terraform and cloud by building small, self-contained projects in **Azure** and **AWS**.
Each project is deployed with Terraform and documented with architecture diagrams and a description of what I built and why.

## Objectives

- Learn cloud fundamentals in both Azure and AWS
- Learn Terraform and Infrastructure as Code
- Understand and compare how the same concepts are solved on different cloud platforms
- Document architecture decisions and lessons learned for each project
- Write all Terraform code myself, using ONLY the official documentation. No AI tools for the code. AI may help with documentation and to prettify Diagrams.

## Structure

The repository is split by cloud provider. Each provider folder contains one folder per project.

```
homelab/
├── azure/
│   └── <project-name>/
│       ├── README.md        # Project description and purpose
│       ├── diagrams/        # Architecture diagrams
│       └── terraform/       # Terraform code for the project
└── aws/
    └── <project-name>/
        ├── README.md
        ├── diagrams/
        └── terraform/
```

### Project contents

Every project folder contains:

| Item | Description |
| --- | --- |
| `README.md` | What the project is, why I am doing it, and what I learned |
| `diagrams/` | Architecture diagrams showing the solution |
| `terraform/` | The Terraform code used to deploy the infrastructure |

### Project README

Each project README describes:

- **Description** — what the project builds
- **Purpose** — why I am doing the project and what I want to learn from it
- **Architecture** — overview of the solution with reference to the diagrams
- **Deployment** — how to deploy and destroy the infrastructure with Terraform
- **Lessons learned** — what I learned, challenges and things I would do differently

## Projects

### Azure

| Project | Description |
| --- | --- |
| [01-vnet-linux-vm](azure/01-vnet-linux-vm/) | Virtual network with an NSG and a Linux VM |
| [02-load-balancer-web-vm](azure/02-load-balancer-web-vm/) | Private web VM (nginx via cloud-init) behind an Azure Load Balancer |
| [03-hub-and-spoke](azure/03-hub-and-spoke/) | Hub-and-spoke network with VNet peering and a shared Azure Bastion in the hub |

### AWS

| Project | Description |
| --- | --- |
| _Coming soon_ | |
