data "azurerm_resource_group" "nsg" {
  name = var.resource_group_name
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.nsg.location
  resource_group_name = data.azurerm_resource_group.nsg.name
}


resource "azurerm_network_security_rule" "predefined_rules" {
  count                       = length(var.predefined_rules)
  name                        = lookup(var.predefined_rules[count.index], "name")
  priority                    = lookup(var.predefined_rules[count.index], "priority", 4096 - length(var.predefined_rules) + count.index)
  direction                   = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 0)
  access                      = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 1)
  protocol                    = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 2)
  source_port_ranges          = split(",", replace(lookup(var.predefined_rules[count.index], "source_port_range", "*"), "*", "0-65535"))
  destination_port_range      = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 4)
  description                 = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 5)
  source_address_prefix       = join(",", var.source_address_prefix)
  destination_address_prefix  = join(",", var.destination_address_prefix)
  resource_group_name         = data.azurerm_resource_group.nsg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "sub_assoc" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}