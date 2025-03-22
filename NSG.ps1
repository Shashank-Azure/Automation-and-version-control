# Define variables 
$resourceGroupName = "powershell_resource_group" # Replace with your resource group name
$location = "East US" # Replace with your desired location
$nsgName = "myNSG" # Replace with your desired NSG name

# Check if the resource group exists
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    Write-Error "Resource group '$resourceGroupName' not found. Please create it first."
    return # Exit the script
}

# Create the NSG
try {
    New-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $resourceGroupName -Location $location -ErrorAction Stop
    Write-Host "Network Security Group '$nsgName' created successfully."
}
catch {
    Write-Error "Failed to create Network Security Group: $($_.Exception.Message)"
}

# Optional: Add security rules Allow SSH 
try {
    $nsg = Get-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $resourceGroupName
    $rule = New-AzNetworkSecurityRuleConfig -Name "AllowSSH" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 22
    Add-AzNetworkSecurityRuleConfig -NetworkSecurityGroup $nsg -NetworkSecurityRule $rule | Set-AzNetworkSecurityGroup
    Write-Host "Security rule 'AllowSSH' added to '$nsgName' successfully."
}
catch {
    Write-Warning "Failed to add security rule: $($_.Exception.Message)"
}


