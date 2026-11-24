variable "resource_group_name" {
  default = "rg-homelab"
}

variable "location" {
  default = "germanywestcentral"
}

variable "network_security_groups" {
  type = map(object({
    name = string
    rules = list(object({
      name                  = string
      port                  = string
      priority              = number
      source_address_prefix = string
      protocol              = optional(string, "Tcp")
      direction             = optional(string, "Inbound")
      access                = optional(string, "Allow")
    }))
  }))
  default = {
    spoke1 = {
      name = "nsg-spoke1"
      rules = [
        { name = "AllowSSHFromBastion", port = "22", priority = 100, source_address_prefix = "10.0.1.0/26" },
        { name = "DenyVnetInbound", port = "*", priority = 4000, source_address_prefix = "VirtualNetwork", protocol = "*", access = "Deny" }
      ]
    }
    spoke2 = {
      name = "nsg-spoke2"
      rules = [
        { name = "AllowSSHFromBastion", port = "22", priority = 100, source_address_prefix = "10.0.1.0/26" },
        { name = "DenyVnetInbound", port = "*", priority = 4000, source_address_prefix = "VirtualNetwork", protocol = "*", access = "Deny" }
      ]
    }
  }
}

variable "vnets" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
  default = {
    hub    = { name = "vnet-hub", address_space = ["10.0.0.0/16"] }
    spoke1 = { name = "vnet-spoke1", address_space = ["10.1.0.0/16"] }
    spoke2 = { name = "vnet-spoke2", address_space = ["10.2.0.0/16"] }
  }
}

variable "subnets" {
  type = map(object({
    name             = string
    vnet_key         = string
    address_prefixes = list(string)
  }))
  default = {
    "azure_bastion" = {
      name             = "AzureBastionSubnet"
      vnet_key         = "hub"
      address_prefixes = ["10.0.1.0/26"]
    }
    "spoke1" = {
      name             = "snet-spoke1",
      vnet_key         = "spoke1",
      address_prefixes = ["10.1.1.0/24"]
    }
    "spoke2" = {
      name             = "snet-spoke2"
      vnet_key         = "spoke2"
      address_prefixes = ["10.2.1.0/24"]
    }
  }
}

variable "nsg_associations" {
  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))
  default = {
    "spoke1" = { subnet_key = "spoke1", nsg_key = "spoke1" }
    "spoke2" = { subnet_key = "spoke2", nsg_key = "spoke2" }
  }
}
