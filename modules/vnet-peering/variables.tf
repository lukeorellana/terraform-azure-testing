# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "first_vnet" {
  description = "The name of the first vnet to peer"
  type        = string
}

variable "second_vnet" {
  description = "The name of the second vnet to peer"
  type        = string
}

variable "first_vnet_rg_name" {
  description = "The name of the resource group of the first vnet to peer"
  type        = string
}

variable "second_vnet_rg_name" {
  description = "The name of the resource group of the second vnet to peer"
  type        = string
}