variable "system" {
  type        = string
  description = "Name of the system or environment"
  default     = "terratest"
}

variable "location" {
  type        = string
  description = "Azure location of terraform server environment"
  default     = "westus2"

}

variable "peer_vnet_name" {
  type        = string
  description = "Name of VNet to peer with"

}

variable "peer_vnet_rg" {
  type        = string
  description = "Resource Group name of vnet to peer with"
}

variable "vnet_address_space" {
  description = "Address space for Virtual Network"
}

variable "subnet_prefix" {
  type        = string
  description = "Prefix of subnet address"
}