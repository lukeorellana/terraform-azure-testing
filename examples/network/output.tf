output "vnet_rg" {
  description = "Location of vnet"
  value       = module.vnet.vnet_rg
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.vnet.subnet_id
}

output "nsg_name" {
  description = "Name of vnet Security Group"
  value       = module.nsg.nsg_name
}
