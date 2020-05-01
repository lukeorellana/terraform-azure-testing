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

variable "first_vnet_address_space" {
  description = "Address space for Virtual Network"
}

variable "first_subnet_prefix" {
  type        = string
  description = "Prefix of subnet address"
}

variable "second_vnet_address_space" {
  description = "Address space for Virtual Network"
}

variable "second_subnet_prefix" {
  type        = string
  description = "Prefix of subnet address"
}