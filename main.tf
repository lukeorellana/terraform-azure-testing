provider "azurerm" {
  version = "1.37.0"
}


#Create a virtual networks
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.location}-${var.system}"
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.rg_name
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "snet-dev-${var.location}-${var.system}-001 "
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = var.subnet_prefix
}

