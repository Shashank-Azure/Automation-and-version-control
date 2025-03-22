$resourceGroupName = "powershell_resource-group"
$location = "eastus"

try {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
    Write-Host "Resource group '$resourceGroupName' created successfully in location '$location'." -ForegroundColor Green
}
catch {
    Write-Error "Failed to create resource group: $($_.Exception.Message)"
}
