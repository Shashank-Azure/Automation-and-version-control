# validate_rg.ps1 (Validation script)
$resourceGroupName = "powershell_resource-group"

try {
    $resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction Stop

    if ($resourceGroup) {
        Write-Host "Resource group '$resourceGroupName' exists." -ForegroundColor Green
        exit 0 # Exit with zero exit code to signal success
    } else {
        Write-Error "Resource group '$resourceGroupName' does not exist."
        exit 1 # Exit with non-zero exit code to signal failure
    }
}
catch {
    Write-Error "Error during validation: $($_.Exception.Message)"
    exit 1
}
