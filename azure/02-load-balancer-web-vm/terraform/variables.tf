variable "resource_group_name" {
  default = "rg-homelab"
}


variable "location" {
  default = "germanywestcentral"
}

variable "nsg_name" {
  default = "nsg-snet-vm-homelab"

}

variable "vnet_name" {
  default = "vnet-homelab"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "snet_vm_name" {
  default = "snet-vm-homelab"
}

variable "snet_azure_bastion_name" {
  default = "AzureBastionSubnet"
}

