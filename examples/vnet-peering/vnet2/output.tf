output "first_peer_id" {
  description = "ID of the first Virtual Network peer"
  value       = module.vnet_peer.first_peer_id
}

output "second_peer_id" {
  description = "ID of the second Virtual Network peer"
  value       = module.vnet_peer.second_peer_id
}