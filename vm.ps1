# vm.ps1 - Create a Linux Virtual Machine in Azure using PowerShell
# Based on: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-powershell
# Updated with provided variables

# Parameters (Customize these for your environment)
$resourceGroupName = "powershell_resource_group"
$location = "East US" # Choose your desired location
$vmName = "myLinuxVM"
$username = "Shashankncpl"
$password = ConvertTo-SecureString "Shashank@01" -AsPlainText -Force # Replace with your password
$vnetName = "myVNet"
$subnetName = "mySubnet"
$publicIpName = "myPublicIP"
$nicName = "myNIC"
$imagePublisher = "Canonical"
$imageOffer = "UbuntuServer"
$imageSku = "20.04-LTS" # Or another desired SKU, like ,18.04-LTS,20.04-LTS, 22.04-LTS, etc.
$imageVersion = "latest"
$vmSize = "Standard_DS1_v2" # Choose your desired VM size

# Install Azure Az module (if needed)
try {
    Get-Module -Name Az -ListAvailable -ErrorAction Stop
}
catch {
    Write-Warning "Azure Az module not found. Installing..."
    Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
}

# Create Network resources
try {
    $publicIp = New-AzPublicIpAddress -Name $publicIpName -ResourceGroupName $resourceGroupName -Location $location -AllocationMethod Dynamic
    $vnet = New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -Location $location -AddressPrefix 10.0.0.0/16
    $subnet = New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix 10.0.1.0/24
    $nic = New-AzNetworkInterface -Name $nicName -ResourceGroupName $resourceGroupName -Location $location -PublicIpAddressId $publicIp.Id -SubnetId $vnet.Subnets[0].Id
}
catch {
    Write-Error "Failed to create network resources: $($_.Exception.Message)"
    exit 1
}

# Create VM configuration
$cred = New-Object System.Management.Automation.PSCredential($username, $password)
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize |
    Set-AzVMOperatingSystem -Linux -ComputerName $vmName -Credential $cred |
    Set-AzVMSourceImage -PublisherName $imagePublisher -Offer $imageOffer -Sku $imageSku -Version $imageVersion

# Create VM
try {
    New-AzVM -ResourceGroupName $resourceGroupName -Location $location -NetworkInterface $nic -VM $vmConfig
    Write-Host "Virtual machine '$vmName' created successfully."
}
catch {
    Write-Error "Failed to create virtual machine: $($_.Exception.Message)"
    exit 1
}

Write-Host "Script completed."
