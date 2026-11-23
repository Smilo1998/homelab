variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
  default     = "rg-homelab"
}

variable "location" {
  description = "Location of resources deployed"
  type        = string
  default     = "germanywestcentral"
}

variable "vnet_name" {
  description = "Name of virtual network"
  type        = string
  default     = "vnet-homelab"
}

variable "vnet_address_space" {
  description = "Address Space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "snet-vm-homelab"
}

variable "subnet_address_space" {
  description = "Address Space for the subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "nsg-vm-homelab"
}

variable "ssh_allowed_cidr" {
  description = "Public IP (CIDR) allowed to SSH into the VM. Set in terraform.tfvars"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the VM public IP"
  type        = string
  default     = "pip-vm-homelab"
}

variable "nic_name" {
  description = "Name of the VM network interface"
  type        = string
  default     = "nic-vm-homelab"
}

variable "vm_name" {
  description = "Name of Virtual Machine"
  type        = string
  default     = "vm-homelab"
}

variable "vm_sku" {
  description = "Size/SKU of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Name of the VM Admin"
  type        = string
  default     = "adminuser"
}
