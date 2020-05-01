variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "nsg_name" {
  description = "Network security group name"
  default     = "nsg"
}


variable "predefined_rules" {
  description = "Predefined rules from the rules.tf list"
  type        = list(any)
  default     = []
}

variable "source_address_prefix" {
  description = "Source address prefix to be applied to all rules."
  type        = list(string)
  default     = ["*"]

  # Example ["10.0.3.0/24"] or ["VirtualNetwork"]
}

variable "destination_address_prefix" {
  description = "Destination address prefix to be applied to all rules."
  type        = list(string)
  default     = ["*"]

  # Example ["10.0.3.0/32","10.0.3.128/32"] or ["VirtualNetwork"] 
}

variable "subnet_id" {
  description = "The id of the subnet to attach to the nsg"
  type        = string
}