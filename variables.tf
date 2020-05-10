variable "system" {
  type        = string
  default     = "terratest"
}

variable "location" {
  type        = string
  description = "Azure region location of Virtual Network"
  default     = "westus2"

}

variable "rg_name" {
  type        = string
  description = "Name of resource group"
  default     = "westus2"

}

variable "vnet_address_space" {
  description = "Address space for Virtual Network"
}

variable "subnet_prefix" {
  type        = string
  description = "Prefix of subnet address"
}