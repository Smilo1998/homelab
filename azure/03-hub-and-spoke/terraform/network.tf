########################################################################
# -- Configure the networking resources for the hub and spoke --
########################################################################

resource "azurerm_network_security_group" "nsgs" {
  for_each            = var.network_security_groups
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  dynamic "security_rule" {
    for_each = each.value.rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      destination_port_range     = security_rule.value.port
      source_address_prefix      = security_rule.value.source_address_prefix
      protocol                   = security_rule.value.protocol
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      source_port_range          = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_virtual_network" "vnets" {
  for_each            = var.vnets
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.name
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_key].name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "nsg_associations" {
  for_each                  = var.nsg_associations
  subnet_id                 = azurerm_subnet.subnets[each.value.subnet_key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.value.nsg_key].id
}
