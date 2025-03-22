# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Get the request body.
$RequestBody = Get-Content $Request -Raw | ConvertFrom-Json

# Extract resource ID from the request body.
$ResourceId = $RequestBody.data.resourceUri

# Check if the resource ID is valid.
if (-not $ResourceId) {
    Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = 400
        Body = "Resource ID is missing in the request body."
    })
    return
}

try {
    # Get the resource.
    $Resource = Get-AzResource -ResourceId $ResourceId

    # Check if the resource has tags.
    if (-not $Resource.Tags) {
        Write-Host "Resource '$ResourceId' has no tags. Adding default tags."

        # Define your default tags.
        $Tags = @{
            Environment = "Production"
            Owner = "YourTeam"
            CostCenter = "12345"
        }

        # Update the resource with the tags.
        Set-AzResource -ResourceId $ResourceId -Tag $Tags

        Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
            StatusCode = 200
            Body = "Tags added successfully to resource '$ResourceId'."
        })
    } else {
        Write-Host "Resource '$ResourceId' already has tags. No action taken."
        Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
            StatusCode = 200
            Body = "Resource '$ResourceId' already has tags."
        })
    }
} catch {
    Write-Error "Error processing resource '$ResourceId': $($_.Exception.Message)"
    Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = 500
        Body = "Error processing resource: $($_.Exception.Message)"
    })
}
