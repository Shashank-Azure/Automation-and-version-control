#
# Module manifest for module 'Az.Resources'
#
# Generated by: Microsoft Corporation
#
# Generated on: 2/25/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Az.Resources.psm1'

# Version number of this module.
ModuleVersion = '7.9.0'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '48bb344d-4c24-441e-8ea0-589947784700'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Azure Resource Manager and Active Directory cmdlets in Windows PowerShell and PowerShell Core.  Manages subscriptions, tenants, resource groups, deployment templates, providers, and resource permissions in Azure Resource Manager.  Provides cmdlets for managing resources generically across resource providers.
For more information on Resource Manager, please visit the following: https://learn.microsoft.com/azure/azure-resource-manager/
For more information on Active Directory, please visit the following: https://learn.microsoft.com/azure/active-directory/fundamentals/active-directory-whatis'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.7.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = 'Authorization.Autorest/bin/Az.Authorization.private.dll', 
               'DataBoundary.Autorest/bin/Az.DataBoundary.private.dll', 
               'Microsoft.Azure.Management.ManagementGroups.dll', 
               'Microsoft.Azure.Management.ResourceManager.dll', 
               'Microsoft.Azure.PowerShell.Authorization.Management.Sdk.dll', 
               'Microsoft.Azure.PowerShell.Resources.Management.Sdk.dll', 
               'Microsoft.Extensions.Caching.Abstractions.dll', 
               'Microsoft.Extensions.Caching.Memory.dll', 
               'Microsoft.Extensions.DependencyInjection.Abstractions.dll', 
               'Microsoft.Extensions.Options.dll', 
               'Microsoft.Extensions.Primitives.dll', 
               'MSGraph.Autorest/bin/Az.MSGraph.private.dll', 
               'Policy.Autorest/bin/Az.Policy.private.dll', 
               'System.Runtime.CompilerServices.Unsafe.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'Authorization.Autorest/Az.Authorization.format.ps1xml', 
               'DataBoundary.Autorest/Az.DataBoundary.format.ps1xml', 
               'MSGraph.Autorest/Az.MSGraph.format.ps1xml', 
               'Policy.Autorest/Az.Policy.format.ps1xml', 
               'ResourceManager.format.ps1xml', 
               'ResourceManager.generated.format.ps1xml', 
               'Resources.format.ps1xml', 'Tags.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('Authorization.Autorest/Az.Authorization.psm1', 'DataBoundary.Autorest/Az.DataBoundary.psm1', 'MSGraph.Autorest/Az.MSGraph.psm1', 'Policy.Autorest/Az.Policy.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-AzADAppPermission', 'Add-AzADGroupMember', 
               'Get-AzADAppCredential', 'Get-AzADAppFederatedCredential', 
               'Get-AzADApplication', 'Get-AzADAppPermission', 'Get-AzADGroup', 
               'Get-AzADGroupMember', 'Get-AzADGroupOwner', 'Get-AzADOrganization', 
               'Get-AzADServicePrincipal', 
               'Get-AzADServicePrincipalAppRoleAssignment', 'Get-AzADSpCredential', 
               'Get-AzADUser', 'Get-AzDataBoundaryScope', 'Get-AzDataBoundaryTenant', 
               'Get-AzPolicyAssignment', 'Get-AzPolicyDefinition', 
               'Get-AzPolicyExemption', 'Get-AzPolicySetDefinition', 
               'Get-AzRoleAssignmentSchedule', 
               'Get-AzRoleAssignmentScheduleInstance', 
               'Get-AzRoleAssignmentScheduleRequest', 
               'Get-AzRoleEligibilitySchedule', 
               'Get-AzRoleEligibilityScheduleInstance', 
               'Get-AzRoleEligibilityScheduleRequest', 
               'Get-AzRoleEligibleChildResource', 'Get-AzRoleManagementPolicy', 
               'Get-AzRoleManagementPolicyAssignment', 'New-AzADAppCredential', 
               'New-AzADAppFederatedCredential', 'New-AzADApplication', 
               'New-AzADGroup', 'New-AzADGroupOwner', 'New-AzADServicePrincipal', 
               'New-AzADServicePrincipalAppRoleAssignment', 'New-AzADSpCredential', 
               'New-AzADUser', 'New-AzPolicyAssignment', 'New-AzPolicyDefinition', 
               'New-AzPolicyExemption', 'New-AzPolicySetDefinition', 
               'New-AzRoleAssignmentScheduleRequest', 
               'New-AzRoleEligibilityScheduleRequest', 
               'New-AzRoleManagementPolicyAssignment', 'Remove-AzADAppCredential', 
               'Remove-AzADAppFederatedCredential', 'Remove-AzADApplication', 
               'Remove-AzADAppPermission', 'Remove-AzADGroup', 
               'Remove-AzADGroupMember', 'Remove-AzADGroupOwner', 
               'Remove-AzADServicePrincipal', 
               'Remove-AzADServicePrincipalAppRoleAssignment', 
               'Remove-AzADSpCredential', 'Remove-AzADUser', 
               'Remove-AzPolicyAssignment', 'Remove-AzPolicyDefinition', 
               'Remove-AzPolicyExemption', 'Remove-AzPolicySetDefinition', 
               'Remove-AzRoleManagementPolicy', 
               'Remove-AzRoleManagementPolicyAssignment', 'Set-AzDataBoundary', 
               'Stop-AzRoleAssignmentScheduleRequest', 
               'Stop-AzRoleEligibilityScheduleRequest', 
               'Update-AzADAppFederatedCredential', 'Update-AzADApplication', 
               'Update-AzADGroup', 'Update-AzADServicePrincipal', 
               'Update-AzADServicePrincipalAppRoleAssignment', 'Update-AzADUser', 
               'Update-AzPolicyAssignment', 'Update-AzPolicyDefinition', 
               'Update-AzPolicyExemption', 'Update-AzPolicySetDefinition', 
               'Update-AzRoleManagementPolicy'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Export-AzResourceGroup', 'Export-AzTemplateSpec', 
               'Get-AzDenyAssignment', 'Get-AzDeployment', 
               'Get-AzDeploymentOperation', 'Get-AzDeploymentScript', 
               'Get-AzDeploymentScriptLog', 'Get-AzDeploymentWhatIfResult', 
               'Get-AzLocation', 'Get-AzManagedApplication', 
               'Get-AzManagedApplicationDefinition', 'Get-AzManagementGroup', 
               'Get-AzManagementGroupDeployment', 
               'Get-AzManagementGroupDeploymentOperation', 
               'Get-AzManagementGroupDeploymentStack', 
               'Get-AzManagementGroupDeploymentWhatIfResult', 
               'Get-AzManagementGroupEntity', 
               'Get-AzManagementGroupHierarchySetting', 
               'Get-AzManagementGroupNameAvailability', 
               'Get-AzManagementGroupSubscription', 'Get-AzPolicyAlias', 
               'Get-AzPrivateLinkAssociation', 'Get-AzProviderFeature', 
               'Get-AzProviderOperation', 'Get-AzProviderPreviewFeature', 
               'Get-AzResource', 'Get-AzResourceGroup', 
               'Get-AzResourceGroupDeployment', 
               'Get-AzResourceGroupDeploymentOperation', 
               'Get-AzResourceGroupDeploymentStack', 
               'Get-AzResourceGroupDeploymentWhatIfResult', 'Get-AzResourceLock', 
               'Get-AzResourceManagementPrivateLink', 'Get-AzResourceProvider', 
               'Get-AzRoleAssignment', 'Get-AzRoleDefinition', 
               'Get-AzSubscriptionDeploymentStack', 'Get-AzTag', 
               'Get-AzTemplateSpec', 'Get-AzTenantBackfillStatus', 
               'Get-AzTenantDeployment', 'Get-AzTenantDeploymentOperation', 
               'Get-AzTenantDeploymentWhatIfResult', 'Invoke-AzResourceAction', 
               'Move-AzResource', 'New-AzDeployment', 'New-AzManagedApplication', 
               'New-AzManagedApplicationDefinition', 'New-AzManagementGroup', 
               'New-AzManagementGroupDeployment', 
               'New-AzManagementGroupDeploymentStack', 
               'New-AzManagementGroupHierarchySetting', 
               'New-AzManagementGroupSubscription', 'New-AzPrivateLinkAssociation', 
               'New-AzResource', 'New-AzResourceGroup', 
               'New-AzResourceGroupDeployment', 
               'New-AzResourceGroupDeploymentStack', 'New-AzResourceLock', 
               'New-AzResourceManagementPrivateLink', 'New-AzRoleAssignment', 
               'New-AzRoleDefinition', 'New-AzSubscriptionDeploymentStack', 
               'New-AzTag', 'New-AzTemplateSpec', 'New-AzTenantDeployment', 
               'Publish-AzBicepModule', 'Register-AzProviderFeature', 
               'Register-AzProviderPreviewFeature', 'Register-AzResourceProvider', 
               'Remove-AzDeployment', 'Remove-AzDeploymentScript', 
               'Remove-AzManagedApplication', 
               'Remove-AzManagedApplicationDefinition', 'Remove-AzManagementGroup', 
               'Remove-AzManagementGroupDeployment', 
               'Remove-AzManagementGroupDeploymentStack', 
               'Remove-AzManagementGroupHierarchySetting', 
               'Remove-AzManagementGroupSubscription', 
               'Remove-AzPrivateLinkAssociation', 'Remove-AzResource', 
               'Remove-AzResourceGroup', 'Remove-AzResourceGroupDeployment', 
               'Remove-AzResourceGroupDeploymentStack', 'Remove-AzResourceLock', 
               'Remove-AzResourceManagementPrivateLink', 'Remove-AzRoleAssignment', 
               'Remove-AzRoleDefinition', 'Remove-AzSubscriptionDeploymentStack', 
               'Remove-AzTag', 'Remove-AzTemplateSpec', 'Remove-AzTenantDeployment', 
               'Save-AzDeploymentScriptLog', 'Save-AzDeploymentTemplate', 
               'Save-AzManagementGroupDeploymentStackTemplate', 
               'Save-AzManagementGroupDeploymentTemplate', 
               'Save-AzResourceGroupDeploymentStackTemplate', 
               'Save-AzResourceGroupDeploymentTemplate', 
               'Save-AzSubscriptionDeploymentStackTemplate', 
               'Save-AzTenantDeploymentTemplate', 'Set-AzManagedApplication', 
               'Set-AzManagedApplicationDefinition', 
               'Set-AzManagementGroupDeploymentStack', 'Set-AzResource', 
               'Set-AzResourceGroup', 'Set-AzResourceGroupDeploymentStack', 
               'Set-AzResourceLock', 'Set-AzRoleAssignment', 'Set-AzRoleDefinition', 
               'Set-AzSubscriptionDeploymentStack', 'Set-AzTemplateSpec', 
               'Start-AzTenantBackfill', 'Stop-AzDeployment', 
               'Stop-AzManagementGroupDeployment', 
               'Stop-AzResourceGroupDeployment', 'Stop-AzTenantDeployment', 
               'Test-AzDeployment', 'Test-AzManagementGroupDeployment', 
               'Test-AzManagementGroupDeploymentStack', 
               'Test-AzResourceGroupDeployment', 
               'Test-AzResourceGroupDeploymentStack', 
               'Test-AzSubscriptionDeploymentStack', 'Test-AzTenantDeployment', 
               'Unregister-AzProviderFeature', 
               'Unregister-AzProviderPreviewFeature', 
               'Unregister-AzResourceProvider', 'Update-AzManagementGroup', 
               'Update-AzManagementGroupHierarchySetting', 'Update-AzTag'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Get-AzADServicePrincipalCredential', 
               'Get-AzResourceProviderAction', 'Get-AzSubscriptionDeployment', 
               'Get-AzSubscriptionDeploymentOperation', 
               'Get-AzSubscriptionDeploymentWhatIfResult', 
               'New-AzADServicePrincipalCredential', 
               'New-AzSubscriptionDeployment', 
               'Remove-AzADServicePrincipalCredential', 
               'Remove-AzSubscriptionDeployment', 
               'Save-AzSubscriptionDeploymentTemplate', 'Set-AzADApplication', 
               'Set-AzADServicePrincipal', 'Set-AzADUser', 'Set-AzPolicyAssignment', 
               'Set-AzPolicyDefinition', 'Set-AzPolicyExemption', 
               'Set-AzPolicySetDefinition', 'Stop-AzSubscriptionDeployment', 
               'Test-AzSubscriptionDeployment'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @(@{ModuleName = 'Az.Accounts'; ModuleVersion = '4.0.2'; })

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Azure','ResourceManager','ARM','Provider','ResourceGroup','Deployment','ActiveDirectory','Authorization','Management','ManagementGroups','Tags'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Added ''-ApplicationId'' as an alias of ''-ServicePrincipalName''.
* Supported getting role assignments at the exact scope via ''-AtScope'' for ''Get-AzRoleAssignment''. '

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


# SIG # Begin signature block
# MIIoUgYJKoZIhvcNAQcCoIIoQzCCKD8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBRYgVIaxOkYpk8
# xcr/H92ShNI9zuet6TMSR3itvMgkZqCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
# lV0POxitAAAAAAQDMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQwOTEyMjAxMTEzWhcNMjUwOTExMjAxMTEzWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCfdGddwIOnbRYUyg03O3iz19XXZPmuhEmW/5uyEN+8mgxl+HJGeLGBR8YButGV
# LVK38RxcVcPYyFGQXcKcxgih4w4y4zJi3GvawLYHlsNExQwz+v0jgY/aejBS2EJY
# oUhLVE+UzRihV8ooxoftsmKLb2xb7BoFS6UAo3Zz4afnOdqI7FGoi7g4vx/0MIdi
# kwTn5N56TdIv3mwfkZCFmrsKpN0zR8HD8WYsvH3xKkG7u/xdqmhPPqMmnI2jOFw/
# /n2aL8W7i1Pasja8PnRXH/QaVH0M1nanL+LI9TsMb/enWfXOW65Gne5cqMN9Uofv
# ENtdwwEmJ3bZrcI9u4LZAkujAgMBAAGjggGCMIIBfjAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQU6m4qAkpz4641iK2irF8eWsSBcBkw
# VAYDVR0RBE0wS6RJMEcxLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEWMBQGA1UEBRMNMjMwMDEyKzUwMjkyNjAfBgNVHSMEGDAW
# gBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIw
# MTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDEx
# XzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIB
# AFFo/6E4LX51IqFuoKvUsi80QytGI5ASQ9zsPpBa0z78hutiJd6w154JkcIx/f7r
# EBK4NhD4DIFNfRiVdI7EacEs7OAS6QHF7Nt+eFRNOTtgHb9PExRy4EI/jnMwzQJV
# NokTxu2WgHr/fBsWs6G9AcIgvHjWNN3qRSrhsgEdqHc0bRDUf8UILAdEZOMBvKLC
# rmf+kJPEvPldgK7hFO/L9kmcVe67BnKejDKO73Sa56AJOhM7CkeATrJFxO9GLXos
# oKvrwBvynxAg18W+pagTAkJefzneuWSmniTurPCUE2JnvW7DalvONDOtG01sIVAB
# +ahO2wcUPa2Zm9AiDVBWTMz9XUoKMcvngi2oqbsDLhbK+pYrRUgRpNt0y1sxZsXO
# raGRF8lM2cWvtEkV5UL+TQM1ppv5unDHkW8JS+QnfPbB8dZVRyRmMQ4aY/tx5x5+
# sX6semJ//FbiclSMxSI+zINu1jYerdUwuCi+P6p7SmQmClhDM+6Q+btE2FtpsU0W
# +r6RdYFf/P+nK6j2otl9Nvr3tWLu+WXmz8MGM+18ynJ+lYbSmFWcAj7SYziAfT0s
# IwlQRFkyC71tsIZUhBHtxPliGUu362lIO0Lpe0DOrg8lspnEWOkHnCT5JEnWCbzu
# iVt8RX1IV07uIveNZuOBWLVCzWJjEGa+HhaEtavjy6i7MIIHejCCBWKgAwIBAgIK
# YQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEw
# OTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYD
# VQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+la
# UKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc
# 6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4D
# dato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+
# lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nk
# kDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6
# A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmd
# X4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL
# 5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zd
# sGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3
# T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS
# 4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRI
# bmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
# BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBD
# uRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jv
# c29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1h
# cnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkA
# YwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn
# 8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7
# v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0b
# pdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/
# KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvy
# CInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBp
# mLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJi
# hsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYb
# BL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbS
# oqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sL
# gOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtX
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGiMwghofAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAQDvdWVXQ87GK0AAAAA
# BAMwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIO6+
# Yc1uqcfE6ct/vdqTyZpMJvV3S93ySLLmb0+89KI/MEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAbFE2lVsdkPxjo8segvfdnv3ugVKhh95LltxJ
# 7riEJzYsP4Vx2b00ti06j+CNUC6x0KE/4DyiwEgevGKCU5gFPAuZZl8mnKHTbdQU
# RVKT9VK+gJDn3dNhT271hmul+KpppR0r32cjPgakuKz4NOIQXuDnDXnLhzmO8/ys
# bhOzs/ty7RjB+LKvT01AgX+TyEbhnLMrkHJiJin2q0cv4xOjNUSBdCBmzb/OoxGf
# 3oUlcPmtZGT5RzxDYexuaGQk+/2IzD5Snhtbd/8IWXer87CJfY6/6HW8AsO3tHl4
# vi3INFbvxE1K7jgt8bIUgVkYvchxve2xH2gla1UU1HQ0BbYjhKGCF60wghepBgor
# BgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCCF4YwgheCAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCBmU4n795XWrdJoiL11u2Q/SQgSiF6/wym+
# /J0WymjXugIGZ7YzifmDGBMyMDI1MDIyNTA3MjExNy42MDNaMASAAgH0oIHZpIHW
# MIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjoyRDFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggcoMIIFEKADAgECAhMzAAAB/XP5
# aFrNDGHtAAEAAAH9MA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExNloXDTI1MTAyMjE4MzExNlowgdMxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jv
# c29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVs
# ZCBUU1MgRVNOOjJEMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# oWWs+D+Ou4JjYnRHRedu0MTFYzNJEVPnILzc02R3qbnujvhZgkhp+p/lymYLzkQy
# G2zpxYceTjIF7HiQWbt6FW3ARkBrthJUz05ZnKpcF31lpUEb8gUXiD2xIpo8YM+S
# D0S+hTP1TCA/we38yZ3BEtmZtcVnaLRp/Avsqg+5KI0Kw6TDJpKwTLl0VW0/23sK
# ikeWDSnHQeTprO0zIm/btagSYm3V/8zXlfxy7s/EVFdSglHGsUq8EZupUO8XbHzz
# 7tURyiD3kOxNnw5ox1eZX/c/XmW4H6b4yNmZF0wTZuw37yA1PJKOySSrXrWEh+H6
# ++Wb6+1ltMCPoMJHUtPP3Cn0CNcNvrPyJtDacqjnITrLzrsHdOLqjsH229Zkvndk
# 0IqxBDZgMoY+Ef7ffFRP2pPkrF1F9IcBkYz8hL+QjX+u4y4Uqq4UtT7VRnsqvR/x
# /+QLE0pcSEh/XE1w1fcp6Jmq8RnHEXikycMLN/a/KYxpSP3FfFbLZuf+qIryFL0g
# EDytapGn1ONjVkiKpVP2uqVIYj4ViCjy5pLUceMeqiKgYqhpmUHCE2WssLLhdQBH
# dpl28+k+ZY6m4dPFnEoGcJHuMcIZnw4cOwixojROr+Nq71cJj7Q4L0XwPvuTHQt0
# oH7RKMQgmsy7CVD7v55dOhdHXdYsyO69dAdK+nWlyYcCAwEAAaOCAUkwggFFMB0G
# A1UdDgQWBBTpDMXA4ZW8+yL2+3vA6RmU7oEKpDAfBgNVHSMEGDAWgBSfpxVdAF5i
# XYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENB
# JTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRp
# bWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsF
# AAOCAgEAY9hYX+T5AmCrYGaH96TdR5T52/PNOG7ySYeopv4flnDWQLhBlravAg+p
# jlNv5XSXZrKGv8e4s5dJ5WdhfC9ywFQq4TmXnUevPXtlubZk+02BXK6/23hM0TSK
# s2KlhYiqzbRe8QbMfKXEDtvMoHSZT7r+wI2IgjYQwka+3P9VXgERwu46/czz8IR/
# Zq+vO5523Jld6ssVuzs9uwIrJhfcYBj50mXWRBcMhzajLjWDgcih0DuykPcBpoTL
# lOL8LpXooqnr+QLYE4BpUep3JySMYfPz2hfOL3g02WEfsOxp8ANbcdiqM31dm3vS
# heEkmjHA2zuM+Tgn4j5n+Any7IODYQkIrNVhLdML09eu1dIPhp24lFtnWTYNaFTO
# fMqFa3Ab8KDKicmp0AthRNZVg0BPAL58+B0UcoBGKzS9jscwOTu1JmNlisOKkVUV
# kSJ5Fo/ctfDSPdCTVaIXXF7l40k1cM/X2O0JdAS97T78lYjtw/PybuzX5shxBh/R
# qTPvCyAhIxBVKfN/hfs4CIoFaqWJ0r/8SB1CGsyyIcPfEgMo8ceq1w5Zo0JfnyFi
# 6Guo+z3LPFl/exQaRubErsAUTfyBY5/5liyvjAgyDYnEB8vHO7c7Fg2tGd5hGgYs
# +AOoWx24+XcyxpUkAajDhky9Dl+8JZTjts6BcT9sYTmOodk/SgIwggdxMIIFWaAD
# AgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYD
# VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3Nv
# ZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIy
# MjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5
# vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64
# NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhu
# je3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl
# 3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPg
# yY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I
# 5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2
# ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/
# TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy
# 16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y
# 1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6H
# XtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMB
# AAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQW
# BBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30B
# ATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYB
# BAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMB
# Af8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBL
# oEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMv
# TWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggr
# BgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNS
# b29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1Vffwq
# reEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27
# DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pv
# vinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9Ak
# vUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWK
# NsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2
# kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+
# c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep
# 8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+Dvk
# txW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1Zyvg
# DbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/
# 2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYIDVjCCAj4CAQEwggEBoYHZpIHW
# MIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjoyRDFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAoj0WtVVQUNSK
# oqtrjinRAsBUdoOggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDANBgkqhkiG9w0BAQsFAAIFAOtnSSAwIhgPMjAyNTAyMjQxOTM4MDhaGA8yMDI1
# MDIyNTE5MzgwOFowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA62dJIAIBADAHAgEA
# AgIN8TAHAgEAAgITwTAKAgUA62iaoAIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgor
# BgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUA
# A4IBAQCdfAwUfQuWHzYzALDc8y4Ji8y5WpqnI3pfzb6hEFrmpYbYJSrLp7bAGRil
# loZ9N6YbSm/2clJ8QPLgN7nQOSxdBBzPL8FvcvBZ8J4CNIr90iWoKBSHRQ3hNhIK
# mDy4siO2oCyGvqT9GHPKGXd19pUU7Q0VSFGoRjDjFXA3ESaUc8Mp4sDVXugy11o0
# H3mPT3EN86e/yTxqmpWix++NT9sq0gNGBYSo/9DuYDEoo0NbUXOMpeYxxsxQZ1Oz
# 8ITIQyGDh8nLcP1PrIyxalZZNQ//5hlinly6WGCOYSvCkzrRsxkQnCawdNeS9LIA
# /Xui4plvbqmceNm249cugJk1cWiTMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAH9c/loWs0MYe0AAQAAAf0wDQYJYIZIAWUD
# BAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0B
# CQQxIgQgoBF0qdDIhW6ocSJtyk/kIjC1bYBENceWd3cTFIVDr4IwgfoGCyqGSIb3
# DQEJEAIvMYHqMIHnMIHkMIG9BCCAKEgNyUowvIfx/eDfYSupHkeF1p6GFwjKBs8l
# RB4NRzCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB
# /XP5aFrNDGHtAAEAAAH9MCIEIGMMEmW8AWZK8dcqdScwngTjlnWSoJ4cL1qjbx5B
# pIPkMA0GCSqGSIb3DQEBCwUABIICACUUtJEVM4kgw8aA0OOzWAHeyZbeoRJCwmYo
# vSh3zc4UXZxLwNzTypIrQldquhcRB5WzOvxwuyht3hgTgaYcZxloGWGnHHZZoTWh
# Vue+c2D9nlfNd3tVRxKKzusn6GjpFwXz7uN1ha1CtrnTtXjtzAAcrdxNSncUikLV
# /ZwZhLj6klmdQhIA+EbpEq7IaipVLUq1iQ6x6lwC9/I1AVxu4NWY+RRjRqAEtxeO
# tDE2vOSHVCgg5hG+F/L+LNfidYKwWrduh+wvRRFqeVRtGY9f3br9U5K0+41Xvnli
# G6cX2fO3gP7DCepPGJ/xWqbVRgR8YtDUC6C7YC5Wvjg8wXxD70+FzYpqBIP2oBGD
# jL4ZpnKl8Mjd8ZchtuoGHi0pp+5kLlzGLTwwoo6P0mog60mNXd4Bv6h4Fqx4b2hO
# mDOehYp5Hgr9LGr4AxnEhFtLcu/IJnFFtCpGTvzag6r5eeHcmZnUNg2jpDTHSkh4
# hraTyI/nqhaiwCFwub2ooZktZGi7idGMtQJZqaiuLK4hTrlZSc26FZJoI2hJ9Kqs
# Gjj6rvIIGome93e9piGyNz4/GnY87hQsm//B0W+JAHgJoqdISpSX4WySMTjx0egD
# HWpvnARb8CK1KEp6p+NBZ8F6FuHYgAnkt4k4yOr4vcyk4z3Am9hrTzPM4mG1Fd2U
# Uj/Kmx9R
# SIG # End signature block
