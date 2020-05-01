#create resource group
resource "azurerm_resource_group" "rg_1" {
  name     = "rg-${var.system}1"
  location = var.location

}

module "vnet_1" {
  source = "../../"

  system             = "${var.system}1"
  location           = azurerm_resource_group.rg_1.location
  vnet_address_space = var.first_vnet_address_space
  subnet_prefix      = var.first_subnet_prefix
  rg_name            = azurerm_resource_group.rg_1.name

}

module "nsg_1" {
  source                = "../../modules/nsg"
  resource_group_name   = azurerm_resource_group.rg_1.name
  nsg_name              = "nsg-${var.system}1-httpsallow"
  source_address_prefix = ["VirtualNetwork"]
  predefined_rules = [
    {
      name     = "HTTPS"
      priority = "500"
    },
    {
      name     = "SSH"
      priority = "501"
    }
  ]

  subnet_id = module.vnet_1.subnet_id
}

#create resource group
resource "azurerm_resource_group" "rg_2" {
  name     = "rg-${var.system}2"
  location = var.location

}

module "vnet_2" {
  source = "../../"

  system             = "${var.system}2"
  location           = azurerm_resource_group.rg_2.location
  vnet_address_space = var.second_vnet_address_space
  subnet_prefix      = var.second_subnet_prefix
  rg_name            = azurerm_resource_group.rg_2.name


}

module "nsg_2" {
  source                = "../../modules/nsg"
  resource_group_name   = azurerm_resource_group.rg_2.name
  nsg_name              = "nsg-${var.system}2-httpsallow"
  source_address_prefix = ["VirtualNetwork"]
  predefined_rules = [
    {
      name     = "HTTPS"
      priority = "500"
    },
    {
      name     = "SSH"
      priority = "501"
    }
  ]

  subnet_id = module.vnet_2.subnet_id
}

module "vnet_peer" {
  source      = "../../modules/vnet-peering"
  first_vnet  = module.vnet_1.vnet_name
  second_vnet = module.vnet_2.vnet_name

  first_vnet_rg_name  = module.vnet_1.vnet_rg
  second_vnet_rg_name = module.vnet_2.vnet_rg

}