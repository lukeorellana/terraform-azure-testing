#create resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.system}"
  location = var.location

}

module "vnet" {
  source = "../../../"

  system             = var.system
  location           = azurerm_resource_group.rg.location
  vnet_address_space = var.vnet_address_space
  subnet_prefix      = var.subnet_prefix
  rg_name            = azurerm_resource_group.rg.name

}

module "nsg" {
  source                = "../../../modules/nsg"
  resource_group_name   = azurerm_resource_group.rg.name
  nsg_name              = "nsg-${var.system}-httpsallow"
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

  subnet_id = module.vnet.subnet_id
}

