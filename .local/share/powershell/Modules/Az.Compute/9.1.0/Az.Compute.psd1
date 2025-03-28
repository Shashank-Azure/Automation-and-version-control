#
# Module manifest for module 'Az.Compute'
#
# Generated by: Microsoft Corporation
#
# Generated on: 2/5/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Az.Compute.psm1'

# Version number of this module.
ModuleVersion = '9.1.0'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = 'd4cb9989-9ed1-49c2-bacd-0f8daf758671'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Compute service cmdlets for Azure Resource Manager in Windows PowerShell and PowerShell Core.  Manages virtual machines, hosted services, and related resources in Azure Resource Manager.

For more information on Virtual Machines, please visit the following: https://learn.microsoft.com/azure/virtual-machines/
For more information on Virtual Machine Scale Sets, please visit the following: https://learn.microsoft.com/azure/virtual-machine-scale-sets/'

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
RequiredAssemblies = 'Compute.Autorest/bin/Az.Compute.private.dll', 
               'Microsoft.Azure.Management.ResourceGraph.dll', 
               'Microsoft.Azure.PowerShell.AutoMapper.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.Compute.Helpers.dll', 
               'Microsoft.Azure.PowerShell.Compute.Management.Sdk.dll', 
               'Microsoft.WindowsAzure.Storage.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'Compute.Automation.generated.format.ps1xml', 
               'Compute.Autorest/Az.Compute.format.ps1xml', 
               'Compute.format.ps1xml', 'Compute.generated.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('Compute.Autorest/Az.Compute.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-AzGalleryApplication', 'Get-AzGalleryApplicationVersion', 
               'Invoke-AzSpotPlacementScore', 'New-AzGalleryApplication', 
               'New-AzGalleryApplicationVersion', 'Remove-AzGalleryApplication', 
               'Remove-AzGalleryApplicationVersion', 'Remove-AzVMRunCommand', 
               'Remove-AzVmssVMRunCommand', 'Set-AzVMRunCommand', 
               'Set-AzVmssVMRunCommand', 'Update-AzGalleryApplication', 
               'Update-AzGalleryApplicationVersion'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Add-AzImageDataDisk', 'Add-AzVhd', 
               'Add-AzVMAdditionalUnattendContent', 'Add-AzVMDataDisk', 
               'Add-AzVmGalleryApplication', 'Add-AzVMNetworkInterface', 
               'Add-AzVMSecret', 'Add-AzVmssAdditionalUnattendContent', 
               'Add-AzVmssDataDisk', 'Add-AzVmssDiagnosticsExtension', 
               'Add-AzVmssExtension', 'Add-AzVmssGalleryApplication', 
               'Add-AzVMSshPublicKey', 'Add-AzVmssNetworkInterfaceConfiguration', 
               'Add-AzVmssRunCommand', 'Add-AzVmssSecret', 'Add-AzVmssSshPublicKey', 
               'Add-AzVmssVMDataDisk', 'Add-AzVmssWinRMListener', 
               'ConvertTo-AzVMManagedDisk', 'Disable-AzVMDiskEncryption', 
               'Disable-AzVmssDiskEncryption', 
               'Export-AzLogAnalyticRequestRateByInterval', 
               'Export-AzLogAnalyticThrottledRequest', 'Get-AzAvailabilitySet', 
               'Get-AzCapacityReservation', 'Get-AzCapacityReservationGroup', 
               'Get-AzComputeResourceSku', 'Get-AzDisk', 'Get-AzDiskAccess', 
               'Get-AzDiskEncryptionSet', 
               'Get-AzDiskEncryptionSetAssociatedResource', 'Get-AzGallery', 
               'Get-AzGalleryImageDefinition', 'Get-AzGalleryImageVersion', 
               'Get-AzHost', 'Get-AzHostGroup', 'Get-AzHostSize', 'Get-AzImage', 
               'Get-AzProximityPlacementGroup', 'Get-AzRemoteDesktopFile', 
               'Get-AzRestorePoint', 'Get-AzRestorePointCollection', 
               'Get-AzSnapshot', 'Get-AzSshKey', 'Get-AzVM', 'Get-AzVMAccessExtension', 
               'Get-AzVMADDomainExtension', 'Get-AzVMAEMExtension', 
               'Get-AzVMBootDiagnosticsData', 'Get-AzVMChefExtension', 
               'Get-AzVMCustomScriptExtension', 'Get-AzVMDiagnosticsExtension', 
               'Get-AzVMDiskEncryptionStatus', 'Get-AzVMDscExtension', 
               'Get-AzVMDscExtensionStatus', 'Get-AzVMExtension', 
               'Get-AzVMExtensionImage', 'Get-AzVMExtensionImageType', 
               'Get-AzVMImage', 'Get-AzVMImageOffer', 'Get-AzVMImagePublisher', 
               'Get-AzVMImageSku', 'Get-AzVMRunCommand', 
               'Get-AzVMRunCommandDocument', 'Get-AzVMSize', 
               'Get-AzVMSqlServerExtension', 'Get-AzVmss', 
               'Get-AzVmssDiskEncryption', 'Get-AzVmssRollingUpgrade', 
               'Get-AzVmssSku', 'Get-AzVmssVM', 'Get-AzVmssVMDiskEncryption', 
               'Get-AzVmssVMRunCommand', 'Get-AzVMUsage', 'Grant-AzDiskAccess', 
               'Grant-AzSnapshotAccess', 'Invoke-AzVMInstallPatch', 
               'Invoke-AzVMPatchAssessment', 'Invoke-AzVMReimage', 
               'Invoke-AzVMRunCommand', 'Invoke-AzVmssVMRunCommand', 
               'New-AzAvailabilitySet', 'New-AzCapacityReservation', 
               'New-AzCapacityReservationGroup', 'New-AzDisk', 'New-AzDiskAccess', 
               'New-AzDiskConfig', 'New-AzDiskEncryptionSet', 
               'New-AzDiskEncryptionSetConfig', 'New-AzDiskPurchasePlanConfig', 
               'New-AzDiskUpdateConfig', 'New-AzGallery', 
               'New-AzGalleryImageDefinition', 'New-AzGalleryImageVersion', 
               'New-AzHost', 'New-AzHostGroup', 'New-AzImage', 'New-AzImageConfig', 
               'New-AzProximityPlacementGroup', 'New-AzRestorePoint', 
               'New-AzRestorePointCollection', 'New-AzSnapshot', 
               'New-AzSnapshotConfig', 'New-AzSnapshotUpdateConfig', 'New-AzSshKey', 
               'New-AzVM', 'New-AzVMConfig', 'New-AzVMDataDisk', 
               'New-AzVmGalleryApplication', 'New-AzVMSqlServerAutoBackupConfig', 
               'New-AzVMSqlServerAutoPatchingConfig', 
               'New-AzVMSqlServerKeyVaultCredentialConfig', 'New-AzVmss', 
               'New-AzVmssConfig', 'New-AzVmssGalleryApplication', 
               'New-AzVmssIpConfig', 'New-AzVmssIpTagConfig', 
               'New-AzVmssVaultCertificateConfig', 'Publish-AzVMDscConfiguration', 
               'Remove-AzAvailabilitySet', 'Remove-AzCapacityReservation', 
               'Remove-AzCapacityReservationGroup', 'Remove-AzDisk', 
               'Remove-AzDiskAccess', 'Remove-AzDiskEncryptionSet', 
               'Remove-AzGallery', 'Remove-AzGalleryImageDefinition', 
               'Remove-AzGalleryImageVersion', 'Remove-AzHost', 'Remove-AzHostGroup', 
               'Remove-AzImage', 'Remove-AzImageDataDisk', 
               'Remove-AzProximityPlacementGroup', 'Remove-AzRestorePoint', 
               'Remove-AzRestorePointCollection', 'Remove-AzSnapshot', 
               'Remove-AzSshKey', 'Remove-AzVM', 'Remove-AzVMAccessExtension', 
               'Remove-AzVMAEMExtension', 'Remove-AzVMBackup', 
               'Remove-AzVMChefExtension', 'Remove-AzVMCustomScriptExtension', 
               'Remove-AzVMDataDisk', 'Remove-AzVMDiagnosticsExtension', 
               'Remove-AzVMDiskEncryptionExtension', 'Remove-AzVMDscExtension', 
               'Remove-AzVMExtension', 'Remove-AzVmGalleryApplication', 
               'Remove-AzVMNetworkInterface', 'Remove-AzVMSecret', 
               'Remove-AzVMSqlServerExtension', 'Remove-AzVmss', 
               'Remove-AzVmssDataDisk', 'Remove-AzVmssDiagnosticsExtension', 
               'Remove-AzVmssExtension', 'Remove-AzVmssGalleryApplication', 
               'Remove-AzVmssNetworkInterfaceConfiguration', 
               'Remove-AzVmssRunCommand', 'Remove-AzVmssVMDataDisk', 
               'Repair-AzVmssServiceFabricUpdateDomain', 'Restart-AzHost', 
               'Restart-AzVM', 'Restart-AzVmss', 'Revoke-AzDiskAccess', 
               'Revoke-AzSnapshotAccess', 'Save-AzVhd', 'Save-AzVMImage', 
               'Set-AzDiskDiskEncryptionKey', 'Set-AzDiskImageReference', 
               'Set-AzDiskKeyEncryptionKey', 'Set-AzDiskSecurityProfile', 
               'Set-AzDiskUpdateDiskEncryptionKey', 
               'Set-AzDiskUpdateKeyEncryptionKey', 'Set-AzImageOsDisk', 
               'Set-AzSnapshotDiskEncryptionKey', 'Set-AzSnapshotImageReference', 
               'Set-AzSnapshotKeyEncryptionKey', 
               'Set-AzSnapshotUpdateDiskEncryptionKey', 
               'Set-AzSnapshotUpdateKeyEncryptionKey', 'Set-AzVM', 
               'Set-AzVMAccessExtension', 'Set-AzVMADDomainExtension', 
               'Set-AzVMAEMExtension', 'Set-AzVMBackupExtension', 
               'Set-AzVMBginfoExtension', 'Set-AzVMBootDiagnostic', 
               'Set-AzVMChefExtension', 'Set-AzVMCustomScriptExtension', 
               'Set-AzVMDataDisk', 'Set-AzVMDiagnosticsExtension', 
               'Set-AzVMDiskEncryptionExtension', 'Set-AzVMDscExtension', 
               'Set-AzVMExtension', 'Set-AzVMOperatingSystem', 'Set-AzVMOSDisk', 
               'Set-AzVMPlan', 'Set-AzVMSecurityProfile', 'Set-AzVMSourceImage', 
               'Set-AzVMSqlServerExtension', 'Set-AzVmss', 
               'Set-AzVmssBootDiagnostic', 'Set-AzVmssDiskEncryptionExtension', 
               'Set-AzVmssOrchestrationServiceState', 'Set-AzVmssOsProfile', 
               'Set-AzVmssRollingUpgradePolicy', 'Set-AzVmssSecurityProfile', 
               'Set-AzVmssStorageProfile', 'Set-AzVmssUefi', 'Set-AzVmssVM', 
               'Set-AzVMUefi', 'Start-AzVM', 'Start-AzVmss', 
               'Start-AzVmssRollingExtensionUpgrade', 
               'Start-AzVmssRollingOSUpgrade', 'Stop-AzVM', 'Stop-AzVmss', 
               'Stop-AzVmssRollingUpgrade', 'Test-AzVMAEMExtension', 
               'Update-AzAvailabilitySet', 'Update-AzCapacityReservation', 
               'Update-AzCapacityReservationGroup', 'Update-AzDisk', 
               'Update-AzDiskEncryptionSet', 'Update-AzGallery', 
               'Update-AzGalleryImageDefinition', 'Update-AzGalleryImageVersion', 
               'Update-AzHost', 'Update-AzImage', 'Update-AzRestorePointCollection', 
               'Update-AzSnapshot', 'Update-AzSshKey', 'Update-AzVM', 'Update-AzVmss', 
               'Update-AzVmssInstance', 'Update-AzVmssVM'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Get-AzVmssDiskEncryptionStatus', 
               'Get-AzVmssVMDiskEncryptionStatus', 
               'Invoke-AzSpotPlacementRecommender', 'Invoke-AzVMAssessPatch', 
               'Invoke-AzVMPatchAssess', 'Repair-AzVmssServiceFabricUD'

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
        Tags = 'Azure','ResourceManager','ARM','Compute','IAAS','VM','VirtualMachine'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Added new parameter ''EncryptionIdentity'' to cmdlet ''Set-AzVmssDiskEncryptionExtension''
* Added new parameter ''EncryptionIdentity'' to cmdlet ''New-VmssConfig''
* Added new parameter ''EncryptionIdentity'' to cmdlet ''Set-AzVMDiskEncryptionExtension''
* Added new parameter ''EncryptionIdentity'' to cmdlet ''New-AzVMConfig'''

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
# MIIoRQYJKoZIhvcNAQcCoIIoNjCCKDICAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBJDhNuowX1vJp7
# 3xbM7Q7CQHW4yxEUXgI+N5QvyDlQn6CCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
# Bv9XKydyAAAAAAQEMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQwOTEyMjAxMTE0WhcNMjUwOTExMjAxMTE0WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQC0KDfaY50MDqsEGdlIzDHBd6CqIMRQWW9Af1LHDDTuFjfDsvna0nEuDSYJmNyz
# NB10jpbg0lhvkT1AzfX2TLITSXwS8D+mBzGCWMM/wTpciWBV/pbjSazbzoKvRrNo
# DV/u9omOM2Eawyo5JJJdNkM2d8qzkQ0bRuRd4HarmGunSouyb9NY7egWN5E5lUc3
# a2AROzAdHdYpObpCOdeAY2P5XqtJkk79aROpzw16wCjdSn8qMzCBzR7rvH2WVkvF
# HLIxZQET1yhPb6lRmpgBQNnzidHV2Ocxjc8wNiIDzgbDkmlx54QPfw7RwQi8p1fy
# 4byhBrTjv568x8NGv3gwb0RbAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQU8huhNbETDU+ZWllL4DNMPCijEU4w
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwMDEyKzUwMjkyMzAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzci
# tW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEG
# CCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0
# MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAIjmD9IpQVvfB1QehvpC
# Ge7QeTQkKQ7j3bmDMjwSqFL4ri6ae9IFTdpywn5smmtSIyKYDn3/nHtaEn0X1NBj
# L5oP0BjAy1sqxD+uy35B+V8wv5GrxhMDJP8l2QjLtH/UglSTIhLqyt8bUAqVfyfp
# h4COMRvwwjTvChtCnUXXACuCXYHWalOoc0OU2oGN+mPJIJJxaNQc1sjBsMbGIWv3
# cmgSHkCEmrMv7yaidpePt6V+yPMik+eXw3IfZ5eNOiNgL1rZzgSJfTnvUqiaEQ0X
# dG1HbkDv9fv6CTq6m4Ty3IzLiwGSXYxRIXTxT4TYs5VxHy2uFjFXWVSL0J2ARTYL
# E4Oyl1wXDF1PX4bxg1yDMfKPHcE1Ijic5lx1KdK1SkaEJdto4hd++05J9Bf9TAmi
# u6EK6C9Oe5vRadroJCK26uCUI4zIjL/qG7mswW+qT0CW0gnR9JHkXCWNbo8ccMk1
# sJatmRoSAifbgzaYbUz8+lv+IXy5GFuAmLnNbGjacB3IMGpa+lbFgih57/fIhamq
# 5VhxgaEmn/UjWyr+cPiAFWuTVIpfsOjbEAww75wURNM1Imp9NJKye1O24EspEHmb
# DmqCUcq7NqkOKIG4PVm3hDDED/WQpzJDkvu4FrIbvyTGVU01vKsg4UfcdiZ0fQ+/
# V0hf8yrtq9CkB8iIuk5bBxuPMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQg
# Q29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03
# a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akr
# rnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0Rrrg
# OGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy
# 4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9
# sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAh
# dCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8k
# A/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTB
# w3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmn
# Eyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90
# lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0w
# ggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2o
# ynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsG
# AQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNV
# HSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsG
# AQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABl
# AG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKb
# C5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11l
# hJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6
# I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0
# wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560
# STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQam
# ASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGa
# J+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ah
# XJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA
# 9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33Vt
# Y5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr
# /Xmfwb1tbWrJUnMTDXpQzTGCGiUwghohAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAQEbHQG/1crJ3IAAAAABAQwDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIDjemVmCWDg7BCe+2SInoLCu
# 62xj3HzMMI4OhTljVK6bMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAABpNCSHTYffhIeDkgP9w7hpsuIitEcu1N0XLbtqE2J/HtMe1DLvQhPAv
# M9CGg2TrMOYDDSb9hxYrQsXbF5hwFkZyHgM8WxJFnpKMtVZwD1qfxPaDDJuQVIO1
# xy0gzWWt7YhQCK/ZShS2g4wOiCpQwVPNF8C55nO7WxjA4fX84cjPfAGH16gZnGzT
# cD106xyzDyK2uw5+sBuGZui1JiDGS+NqF4tx4zDrfMUIjaErfC04vmfMq1oMedNA
# BdTDbq6GtBkBCRPdyQDZnO3BIN3lWiK5ISh8Zo3oUESBdXnol6VCmV0HEj1kOICo
# PaqmOqVpgq3BGt8ZGXoKdf2o0ANYOqGCF68wgherBgorBgEEAYI3AwMBMYIXmzCC
# F5cGCSqGSIb3DQEHAqCCF4gwgheEAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFZBgsq
# hkiG9w0BCRABBKCCAUgEggFEMIIBQAIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCCme6+mhaVr6xZXZPAR87j4c8YX1GJROgrZ3MGv6xur3wIGZ5qvsxya
# GBIyMDI1MDIwNjAzMzYyMi4zM1owBIACAfSggdmkgdYwgdMxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVs
# YW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNO
# OjQzMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBT
# ZXJ2aWNloIIR/jCCBygwggUQoAMCAQICEzMAAAH6+ztE03czxtMAAQAAAfowDQYJ
# KoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjQw
# NzI1MTgzMTExWhcNMjUxMDIyMTgzMTExWjCB0zELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NDMxQS0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDKFlUEzc9lwF8SkB/t8giH
# KDBhVU/rhRJ5ltKVFHem8l5u9rQtAINbjnI6u2nAikbIMZf4RsJseFLlN3gnRiVz
# zfO0sRttAPszqSpHReP6fzZwax79CcwfRZFkufCCAl16elDpRyIzicxhm91CPJsD
# ip6M571jTvcmVe/dUht2RAfYkbJPygH8uy88v+QCcnjmhAintLHntE9D/Q7qprIn
# ZImvByMDxq4x0Cdko6LEWXOiiiHtLLJwjsEQ0dOmRUqtFXlh6VG9Y1ODWkfgQLYo
# 7ZvGwE3bdu0x5O9kWJ4Yiv4PyZ/WVBCzQe3+0w5V1qHXi3tiT7GXk/hPDfF8AaAe
# y+xrq6CvHCYpNNfWSpcflcJ3DdNV4oJrHolX7KAzmLU2ugkrAEJbXU/CLTP+SL3R
# l47pd8QT2YKcmbvpBzGLe2db9j/dm6YpDpf+JUgmjsuTRn+kBNHAAg2rB2/Ol21f
# aE4mJvgZHyKzZukqSzTga6t/B5Y+f3PqNjsYEL6OzylLAZ7Ct9/CABs0qbzZkMW+
# oEZBBUnAgdJemORL4bf17Jg4batwgsEgOXNTMwUUls2Hm0O/cZ4ncQq8Li81IDG0
# Z9ob+ZCErjdiN6+wHvYui5TvyvG02G4xdLNoerl8WIbfNyxgdprj7D5iYyuFMTMP
# hICKyHfkGOhc/U/UK3hVrQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFGOMcpsvlZXq
# R3ToqhxAemEr1T+/MB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQC4VsKisWu+h0b5
# k0kfdj43PlClTK1BU5s7JgWuBwavGroxRrjIubE3jFZ0vWTKBpbkE5nfEGU9jtWm
# 5/lvl5pc/upGrrXF46tfd/riQaJJahGL0QlrAlYLMl9RBFOEMvjPEjalhzXCc+nt
# Dr3lserBnTZ5o4G52H8h8SQZ7Q5+PohLejJmwk/XJq1ybiQGogfp1vX7B4zirjo2
# EB8B/TvTMXoX4ilQfKG0xtCDn5Ad867IHOu3rsKIwlIpwnecxXJ82We/rK+21jMs
# rfBL7RDAlSJstgkwjoUZxK5HEqWrpGM6Er0vdA6OHRUIzXWsczXVmY3R64ltsEJV
# 9AS584s2QbzwwUJQ0TXRJJsz86D8JtOSjQznBtW9AnoKosqO0dKh6gAY955fbh/l
# w9jJNwqVszouhR07Y/klJ0jmzUkX86fouJRPnRp2lGy1lqNtgR5f83tG9JuSfR2M
# PcG9PY5/dZ/2Ah5pAgdu/UnY78/lA49CJWjz7QAqbozRMo526KGErEC3/pjKTXsW
# /dEh2NPrCIvapEgSyA4mnd8gvDiZBE+7eylF9qRKhB7k3R7gdYV/xZbZkvT5zzdD
# OHdW0Q8jpjZ7YE795aFNhshsempgN8C0Bi1pgh17ztnKZcbcw7bBSOEv0e9JDOOi
# q6r46hSa98FRwHZ7kvpAIc7qpM7tajCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
# SZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmlj
# YXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIy
# NVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXI
# yjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjo
# YH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1y
# aa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v
# 3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pG
# ve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viS
# kR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYr
# bqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlM
# jgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSL
# W6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AF
# emzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIu
# rQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIE
# FgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWn
# G1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEW
# M2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5
# Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBi
# AEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV
# 9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3Js
# Lm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAx
# MC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2
# LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv
# 6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZn
# OlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1
# bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4
# rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU
# 6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDF
# NLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/
# HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdU
# CbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKi
# excdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTm
# dHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZq
# ELQdVTNYs6FwZvKhggNZMIICQQIBATCCAQGhgdmkgdYwgdMxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVs
# YW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNO
# OjQzMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBT
# ZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQD3hn5tQmf6crAG8gjqyDQ3Lto8NqCBgzCB
# gKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUA
# AgUA605oHzAiGA8yMDI1MDIwNTIyNDM0M1oYDzIwMjUwMjA2MjI0MzQzWjB3MD0G
# CisGAQQBhFkKBAExLzAtMAoCBQDrTmgfAgEAMAoCAQACAhsTAgH/MAcCAQACAhK/
# MAoCBQDrT7mfAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAI
# AgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBADfMQndqo3A/
# m+hfgjjAHLdR8l2RzridiBdIUX6o8k13NLqjFEX2EDXyXgYNxoVNY9LczRy0pqk1
# GW1JcA0GS77SBrbRgp1ff0b3X9yj1iq6ToqZ6HcyGkOGnTfB8oUAi5TPE5OereGF
# KeNRqbeMeosOs88BRMpXld2RufSy96LcT39ywJV02NI0ToGHUwRXyyTM0C6PLIbL
# EBSlon0JBvlJubLXl77Q0WfTxB9cOcdmkgSybAI2gDZPwEAmd7d7ap5Xvetm0msk
# t/J3dEv4yeX87yvsog51M9IoB0UuMmkrUePtQ+OKq6gDgZlTHbqzA+jwTRyEiHRN
# 4lJifVLSI8QxggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMAITMwAAAfr7O0TTdzPG0wABAAAB+jANBglghkgBZQMEAgEFAKCCAUowGgYJ
# KoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCB+ohErKhBu
# aBoz00FlDkC0JtTgJKIo28cGlY48Vq0reTCB+gYLKoZIhvcNAQkQAi8xgeowgecw
# geQwgb0EIH3yfy3Jrz4HaONT92klEjAfAcelyjmiA1K1ihxuQ55WMIGYMIGApH4w
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH6+ztE03czxtMAAQAA
# AfowIgQgr944m8SH8+Fc8zGDBmfq5rHGauUhzvKM+V+DrgXoQ2IwDQYJKoZIhvcN
# AQELBQAEggIAYfdIg3n31kTae9dbyxneuBmSmIixbI5VVQHv/dVl+/YCP8a7PHDP
# RQTC+Yd42GrDhz9oAtrgN/p3gFkaEo+NorRrFTDlqTzX6ibQLib4GmYlQvaRmkfF
# 7OIjXG2be4/7pTeoyKswN2DEowzk4Jm2P1apc8FupZCDgHYLTucg2mnXeUV0kg7i
# Frak+6bAlVW6vyY82ej96eSTVg9MVYxzm+WEoOzV80R9yTJHRIxWXEPVspUdNZXi
# B5KADwSEn5B/ZLe6SqEVptWXaCOd+miyZ1STEZuyj3NYxIDvA7e5xKRoT5XFGeYG
# Ozm24bq2sL/RytCn2bgShTOmZJ0q28WhSgs6vTsfqbcGwcaHRSDXXrgQaUJCSPJ8
# MQXxXiBh8XDj+Bd/90s74cEpGG0rjK1tNbmGMlwAFtitD1vIiTBzBSB/6B5NBKo8
# HpoiuJPzAxr6UhrOFpu9qfrr/tZlQRvXq2BXTPxMiJLN7nBr0cgwRmlR0gDQ+2wn
# SML/yCc/kVxAKAjUkLVUZpDp63luCgXLBykJNolfZeTiMAhk2HNBpB9+TCyxUabS
# UENT1WwCuSQl0gPaRS3pgp+wSE2wpm3kGvJ2oNb8Aya40zH8DNNwUoS4Yx8F3wra
# DOiwlVqYnoKFUfyUKKVqYLIjAp+z3TRC77MalyXsFAQROEFkg/aHgH0=
# SIG # End signature block
