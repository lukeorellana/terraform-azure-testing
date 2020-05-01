output "vnet_rg" {
  description = "Resource Group name of vnet"
  value       = azurerm_virtual_network.vnet.resource_group_name
}

output "vnet_name" {
  description = "Location of vnet"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.subnet.id
}

