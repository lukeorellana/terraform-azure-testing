# Introductions
This is a networking terraform configuration


# Input and Output Variables
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | Azure location of terraform server environment | `string` | `"westus2"` | no |
| subnet\_prefix | Prefix of subnet address | `string` | n/a | yes |
| system | Name of the system or environment | `string` | `"terratest"` | no |
| vnet\_address\_space | Address space for Virtual Network | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nsg\_name | Name of vnet Security Group |
| subnet\_id | Subnet ID |
| vnet\_name | Location of vnet |
| vnet\_rg | Location of vnet |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->