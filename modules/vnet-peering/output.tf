output "first_peer_id" {
  description = "ID of the first Virtual Network peer"
  value       = azurerm_virtual_network_peering.first_peer.id
}

output "second_peer_id" {
  description = "ID of the second Virtual Network peer"
  value       = azurerm_virtual_network_peering.second_peer.id
}
