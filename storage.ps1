# Define variables
$resourceGroupName = "powershell_resource_group" # Replace with your resource group name
$location = "East US" # Replace with your desired location
$storageAccountName = "powershellstoragencpl" 

# Check if the resource group exists
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    Write-Error "Resource group '$resourceGroupName' not found. Please create it first."
    return # Exit the script
}

# Create the storage account
try {
    New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -SkuName Standard_LRS -ErrorAction Stop
    Write-Host "Storage account '$storageAccountName' created successfully."
}
catch {
    Write-Error "Failed to create storage account: $($_.Exception.Message)"
}

