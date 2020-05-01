# Introduction
This is a networking terraform configuration


# Input and Output Variables
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| azurerm | 1.37.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | 1.37.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | Azure region location of Virtual Network | `string` | `"westus2"` | no |
| rg\_name | Name of resource group | `string` | `"westus2"` | no |
| subnet\_prefix | Prefix of subnet address | `string` | n/a | yes |
| system | Name of the system or environment | `string` | `"terratest"` | no |
| vnet\_address\_space | Address space for Virtual Network | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_id | Subnet ID |
| vnet\_name | Location of vnet |
| vnet\_rg | Resource Group name of vnet |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->