# rg.tests.ps1
Describe "rg.ps1 script" {
    It "should define resource group name and location" {
        . .\rg.ps1 # Load the script into the current scope
        $resourceGroupName | Should -Not -BeNullOrEmpty
        $location | Should -Not -BeNullOrEmpty
    }

    It "should handle errors gracefully" {
        Mock New-AzResourceGroup {
            Throw "Simulated Azure Resource Group creation error"
        }

        { . .\rg.ps1 } | Should -Throw
    }

    It "Should output green text when successful" {
        Mock New-AzResourceGroup {} #Mock success
        { . .\rg.ps1 | out-string } | Should -Match "Resource group 'powershell_resource-group' created successfully in location 'eastus'"
    }
}
