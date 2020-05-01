output "vnet_rg" {
  description = "ID of the first Virtual Network peer"
  value       = module.vnet.vnet_rg
}

output "vnet_name" {
  description = "ID of the second Virtual Network peer"
  value       = module.vnet.vnet_name
}
