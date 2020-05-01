output "nsg_id" {
  description = "Name of Network Security Group"
  value       = azurerm_network_security_group.nsg.id
}

output "nsg_name" {
  description = "Name of Network Security Group"
  value       = azurerm_network_security_group.nsg.name
}
