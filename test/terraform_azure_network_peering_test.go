package test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/allanore/aztest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the Terraform module in examples/terraform-azure-example using Terratest.
func TestTerraformAzureNetworkingPeeringExample(t *testing.T) {
	t.Parallel()

	var approvedRegions = []string{
		// Americas
		"centralus",
		"eastus",
		"eastus2",
		"northcentralus",
		"southcentralus",
		"westcentralus",
		"westus",
		"westus2",
	}

	// Pick a random Azure region to test in.
	azureRegion := azure.GetRandomRegion(t, approvedRegions, nil, os.Getenv("ARM_SUBSCRIPTION_ID"))

	// Network Settings for Vnet and Subnet
	vnet1Sysname := fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId()))
	vnet1Address := "10.0.0.0/16"
	vnet1SubnetPrefix := "10.0.0.0/24"
	vnet2Sysname := fmt.Sprintf("test-%s", strings.ToLower(random.UniqueId()))
	vnet2Address := "10.1.0.0/16"
	vnet2SubnetPrefix := "10.1.0.0/24"

	vnet1Opts := &terraform.Options{

		// The path to where our Terraform code is located
		TerraformDir: "../examples/vnet-peering/vnet1",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"system":             vnet1Sysname,
			"location":           azureRegion,
			"vnet_address_space": vnet1Address,
			"subnet_prefix":      vnet1SubnetPrefix,
		},
	}

	// Deploy VNet1
	defer terraform.Destroy(t, vnet1Opts)
	terraform.InitAndApply(t, vnet1Opts)
	vnetOutRG := terraform.Output(t, vnet1Opts, "vnet_rg")
	vnetOutName := terraform.Output(t, vnet1Opts, "vnet_name")

	vnet2Opts := &terraform.Options{

		// The path to where our Terraform code is located
		TerraformDir: "../examples/vnet-peering/vnet2",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"system":             vnet2Sysname,
			"location":           azureRegion,
			"vnet_address_space": vnet2Address,
			"subnet_prefix":      vnet2SubnetPrefix,
			"peer_vnet_rg":       vnetOutRG,
			"peer_vnet_name":     vnetOutName,
		},
	}

	// Deploy VNet2
	defer terraform.Destroy(t, vnet2Opts)
	terraform.InitAndApply(t, vnet2Opts)

	// Validate VNet peering
	vnet2RG := terraform.Output(t, vnet2Opts, "vnet_rg")
	vnet2Name := terraform.Output(t, vnet2Opts, "vnet_name")

	// Look up Virtual Network by Name
	vnet2Properties := azure.GetVnetbyName(t, vnet2RG, vnet2Name, "")

	//Check if each VNet Peering Provisioned Successfully
	for _, vnet := range *vnet2Properties.VirtualNetworkPeerings {
		assert.Equal(t, "Succeeded", string(vnet.VirtualNetworkPeeringPropertiesFormat.ProvisioningState), "Check if Peerings provisioned successfully")
	}
}
