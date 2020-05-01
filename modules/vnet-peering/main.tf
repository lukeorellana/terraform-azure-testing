data "azurerm_virtual_network" "first_vnet" {
  name                = var.first_vnet
  resource_group_name = var.first_vnet_rg_name
}

data "azurerm_virtual_network" "second_vnet" {
  name                = var.second_vnet
  resource_group_name = var.second_vnet_rg_name
}

resource "azurerm_virtual_network_peering" "first_peer" {
  name                      = "${var.first_vnet}-to-${var.second_vnet}"
  resource_group_name       = var.first_vnet_rg_name
  virtual_network_name      = data.azurerm_virtual_network.first_vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.second_vnet.id
}

resource "azurerm_virtual_network_peering" "second_peer" {
  name                      = "${var.second_vnet}-to-${var.first_vnet}"
  resource_group_name       = var.second_vnet_rg_name
  virtual_network_name      = data.azurerm_virtual_network.second_vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.first_vnet.id
}