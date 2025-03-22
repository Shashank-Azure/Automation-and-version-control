# Define variables
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
$imageSku = "18.04-LTS" # Or another desired SKU, like 20.04-LTS, 22.04-LTS, etc.
$imageVersion = "latest"
$vmSize = "Standard_DS1_v2" # Choose your desired VM size

# Create Resource Group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create Virtual Network and Subnet
$subnet = New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix "10.0.1.0/24"
$vnet = New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $subnet

# Create Public IP Address
$publicIp = New-AzPublicIpAddress -Name $publicIpName -ResourceGroupName $resourceGroupName -Location $location -AllocationMethod Static -Sku Standard

# Create Network Interface Card (NIC)
$nic = New-AzNetworkInterface -Name $nicName -ResourceGroupName $resourceGroupName -Location $location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIp.Id

# Create VM configuration
$cred = New-Object System.Management.Automation.PSCredential($username, $password)
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize | Set-AzVMOperatingSystem -Linux -ComputerName $vmName -Credential $cred | Set-AzVMSourceImage -PublisherName $imagePublisher -Offer $imageOffer -Sku $imageSku -Version latest | Add-AzVMNetworkInterface -Id $nic.Id

# Create the VM
New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vmConfig
