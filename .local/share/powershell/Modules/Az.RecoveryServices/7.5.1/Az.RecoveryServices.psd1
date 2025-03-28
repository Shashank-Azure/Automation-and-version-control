#
# Module manifest for module 'Az.RecoveryServices'
#
# Generated by: Microsoft Corporation
#
# Generated on: 2/25/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Az.RecoveryServices.psm1'

# Version number of this module.
ModuleVersion = '7.5.1'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '5af71f43-17ca-45bd-b534-34524b801ade'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Recovery Services cmdlets for Azure Resource Manager in Windows PowerShell and PowerShell Core.

For more information on Recovery Services Backup, please visit the following: https://learn.microsoft.com/azure/backup/
For more information on Site Recovery, please visit the following: https://learn.microsoft.com/azure/site-recovery/'

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
RequiredAssemblies = 'Microsoft.Azure.PowerShell.AutoMapper.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Helpers.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Logger.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Models.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.Providers.dll', 
               'Microsoft.Azure.PowerShell.Cmdlets.RecoveryServices.Backup.ServiceClientAdapter.dll', 
               'Microsoft.Azure.PowerShell.RecoveryServices.Backup.CrossRegionRestore.Management.Sdk.dll', 
               'Microsoft.Azure.PowerShell.RecoveryServices.Backup.Management.Sdk.dll', 
               'Microsoft.Azure.PowerShell.RecoveryServices.Management.Sdk.dll', 
               'Microsoft.Azure.PowerShell.RecoveryServices.SiteRecovery.Management.Sdk.dll', 
               'System.Configuration.ConfigurationManager.dll', 
               'TimeZoneConverter.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'RecoveryServices.Backup.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = 'Add-AzRecoveryServicesAsrReplicationProtectedItemDisk', 
               'Backup-AzRecoveryServicesBackupItem', 
               'Copy-AzRecoveryServicesVault', 
               'Disable-AzRecoveryServicesBackupAutoProtection', 
               'Disable-AzRecoveryServicesBackupProtection', 
               'Disable-AzRecoveryServicesBackupRPMountScript', 
               'Edit-AzRecoveryServicesAsrRecoveryPlan', 
               'Enable-AzRecoveryServicesBackupAutoProtection', 
               'Enable-AzRecoveryServicesBackupProtection', 
               'Get-AzRecoveryServicesAsrAlertSetting', 
               'Get-AzRecoveryServicesAsrEvent', 'Get-AzRecoveryServicesAsrFabric', 
               'Get-AzRecoveryServicesAsrJob', 'Get-AzRecoveryServicesAsrNetwork', 
               'Get-AzRecoveryServicesAsrNetworkMapping', 
               'Get-AzRecoveryServicesAsrPolicy', 
               'Get-AzRecoveryServicesAsrProtectableItem', 
               'Get-AzRecoveryServicesAsrProtectionContainer', 
               'Get-AzRecoveryServicesAsrProtectionContainerMapping', 
               'Get-AzRecoveryServicesAsrRecoveryPlan', 
               'Get-AzRecoveryServicesAsrRecoveryPoint', 
               'Get-AzRecoveryServicesAsrReplicationProtectedItem', 
               'Get-AzRecoveryServicesAsrServicesProvider', 
               'Get-AzRecoveryServicesAsrStorageClassification', 
               'Get-AzRecoveryServicesAsrStorageClassificationMapping', 
               'Get-AzRecoveryServicesAsrVaultContext', 
               'Get-AzRecoveryServicesAsrvCenter', 
               'Get-AzRecoveryServicesBackupContainer', 
               'Get-AzRecoveryServicesBackupItem', 
               'Get-AzRecoveryServicesBackupJob', 
               'Get-AzRecoveryServicesBackupJobDetail', 
               'Get-AzRecoveryServicesBackupManagementServer', 
               'Get-AzRecoveryServicesBackupProperty', 
               'Get-AzRecoveryServicesBackupProtectableItem', 
               'Get-AzRecoveryServicesBackupProtectionPolicy', 
               'Get-AzRecoveryServicesBackupRecommendedArchivableRPGroup', 
               'Get-AzRecoveryServicesBackupRecoveryLogChain', 
               'Get-AzRecoveryServicesBackupRecoveryPoint', 
               'Get-AzRecoveryServicesBackupRetentionPolicyObject', 
               'Get-AzRecoveryServicesBackupRPMountScript', 
               'Get-AzRecoveryServicesBackupSchedulePolicyObject', 
               'Get-AzRecoveryServicesBackupStatus', 
               'Get-AzRecoveryServicesBackupWorkloadRecoveryConfig', 
               'Get-AzRecoveryServicesResourceGuardMapping', 
               'Get-AzRecoveryServicesVault', 
               'Get-AzRecoveryServicesVaultProperty', 
               'Get-AzRecoveryServicesVaultSettingsFile', 
               'Import-AzRecoveryServicesAsrVaultSettingsFile', 
               'Initialize-AzRecoveryServicesBackupProtectableItem', 
               'Initialize-AzRecoveryServicesDSMove', 
               'Move-AzRecoveryServicesBackupRecoveryPoint', 
               'New-AzRecoveryServicesAsrAzureToAzureDiskReplicationConfig', 
               'New-AzRecoveryServicesAsrFabric', 
               'New-AzRecoveryServicesAsrInMageAzureV2DiskInput', 
               'New-AzRecoveryServicesAsrInMageRcmDiskInput', 
               'New-AzRecoveryServicesAsrNetworkMapping', 
               'New-AzRecoveryServicesAsrPolicy', 
               'New-AzRecoveryServicesAsrProtectableItem', 
               'New-AzRecoveryServicesAsrProtectionContainer', 
               'New-AzRecoveryServicesAsrProtectionContainerMapping', 
               'New-AzRecoveryServicesAsrRecoveryPlan', 
               'New-AzRecoveryServicesAsrReplicationProtectedItem', 
               'New-AzRecoveryServicesAsrStorageClassificationMapping', 
               'New-AzRecoveryServicesAsrvCenter', 
               'New-AzRecoveryServicesAsrVMNicConfig', 
               'New-AzRecoveryServicesAsrVMNicIPConfig', 
               'New-AzRecoveryServicesBackupProtectionPolicy', 
               'New-AzRecoveryServicesVault', 
               'Register-AzRecoveryServicesBackupContainer', 
               'Remove-AzRecoveryServicesAsrFabric', 
               'Remove-AzRecoveryServicesAsrNetworkMapping', 
               'Remove-AzRecoveryServicesAsrPolicy', 
               'Remove-AzRecoveryServicesAsrProtectionContainer', 
               'Remove-AzRecoveryServicesAsrProtectionContainerMapping', 
               'Remove-AzRecoveryServicesAsrRecoveryPlan', 
               'Remove-AzRecoveryServicesAsrReplicationProtectedItem', 
               'Remove-AzRecoveryServicesAsrReplicationProtectedItemDisk', 
               'Remove-AzRecoveryServicesAsrServicesProvider', 
               'Remove-AzRecoveryServicesAsrStorageClassificationMapping', 
               'Remove-AzRecoveryServicesAsrvCenter', 
               'Remove-AzRecoveryServicesBackupProtectionPolicy', 
               'Remove-AzRecoveryServicesResourceGuardMapping', 
               'Remove-AzRecoveryServicesVault', 
               'Restart-AzRecoveryServicesAsrJob', 
               'Restore-AzRecoveryServicesBackupItem', 
               'Resume-AzRecoveryServicesAsrJob', 
               'Set-AzRecoveryServicesAsrAlertSetting', 
               'Set-AzRecoveryServicesAsrReplicationProtectedItem', 
               'Set-AzRecoveryServicesAsrVaultContext', 
               'Set-AzRecoveryServicesBackupProperty', 
               'Set-AzRecoveryServicesBackupProtectionPolicy', 
               'Set-AzRecoveryServicesResourceGuardMapping', 
               'Set-AzRecoveryServicesVaultContext', 
               'Set-AzRecoveryServicesVaultProperty', 
               'Start-AzRecoveryServicesAsrApplyRecoveryPoint', 
               'Start-AzRecoveryServicesAsrCancelFailoverJob', 
               'Start-AzRecoveryServicesAsrCommitFailoverJob', 
               'Start-AzRecoveryServicesAsrPlannedFailoverJob', 
               'Start-AzRecoveryServicesAsrResynchronizeReplicationJob', 
               'Start-AzRecoveryServicesAsrSwitchAppliance', 
               'Start-AzRecoveryServicesAsrSwitchProcessServerJob', 
               'Start-AzRecoveryServicesAsrTestFailoverCleanupJob', 
               'Start-AzRecoveryServicesAsrTestFailoverJob', 
               'Start-AzRecoveryServicesAsrUnplannedFailoverJob', 
               'Stop-AzRecoveryServicesAsrJob', 'Stop-AzRecoveryServicesBackupJob', 
               'Test-AzRecoveryServicesDSMove', 
               'Undo-AzRecoveryServicesBackupContainerDeletion', 
               'Undo-AzRecoveryServicesBackupItemDeletion', 
               'Unregister-AzRecoveryServicesBackupContainer', 
               'Unregister-AzRecoveryServicesBackupManagementServer', 
               'Update-AzRecoveryServicesAsrMobilityService', 
               'Update-AzRecoveryServicesAsrNetworkMapping', 
               'Update-AzRecoveryServicesAsrPolicy', 
               'Update-AzRecoveryServicesAsrProtectionContainerMapping', 
               'Update-AzRecoveryServicesAsrProtectionDirection', 
               'Update-AzRecoveryServicesAsrRecoveryPlan', 
               'Update-AzRecoveryServicesAsrServicesProvider', 
               'Update-AzRecoveryServicesAsrvCenter', 
               'Update-AzRecoveryServicesVault', 
               'Wait-AzRecoveryServicesBackupJob'

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Add-ASRReplicationProtectedItemDisk', 'Edit-ASRRecoveryPlan', 
               'Edit-ASRRP', 'Get-ASRAlertSetting', 'Get-ASREvent', 'Get-ASRFabric', 
               'Get-ASRJob', 'Get-ASRNetwork', 'Get-ASRNetworkMapping', 
               'Get-ASRNotificationSetting', 'Get-ASRPolicy', 
               'Get-ASRProtectableItem', 'Get-ASRProtectionContainer', 
               'Get-ASRProtectionContainerMapping', 'Get-ASRRecoveryPlan', 
               'Get-ASRRecoveryPoint', 'Get-ASRReplicationProtectedItem', 
               'Get-ASRRP', 'Get-ASRServicesProvider', 
               'Get-ASRStorageClassification', 
               'Get-ASRStorageClassificationMapping', 'Get-ASRvCenter', 
               'Get-AzRecoveryServicesAsrNotificationSetting', 
               'Get-AzRecoveryServicesAsrVaultSettings', 
               'Get-AzRecoveryServicesBackupProperties', 'New-ASRFabric', 
               'New-AsrInMageAzureV2DiskInput', 'New-ASRInMageRcmDiskInput', 
               'New-ASRNetworkMapping', 'New-ASRPolicy', 'New-ASRProtectableItem', 
               'New-ASRProtectionContainerMapping', 'New-ASRRecoveryPlan', 
               'New-ASRReplicationProtectedItem', 'New-ASRRP', 
               'New-ASRStorageClassificationMapping', 'New-ASRvCenter', 
               'New-ASRVMNicConfig', 'Remove-ASRFabric', 'Remove-ASRNetworkMapping', 
               'Remove-ASRPolicy', 'Remove-ASRProtectionContainerMapping', 
               'Remove-ASRRecoveryPlan', 'Remove-ASRReplicationProtectedItem', 
               'Remove-ASRReplicationProtectedItemDisk', 'Remove-ASRRP', 
               'Remove-ASRServicesProvider', 
               'Remove-ASRStorageClassificationMapping', 'Remove-ASRvCenter', 
               'Restart-ASRJob', 'Resume-ASRJob', 'Set-ASRAlertSetting', 
               'Set-ASRNotificationSetting', 'Set-ASRReplicationProtectedItem', 
               'Set-ASRVaultContext', 'Set-ASRVaultSettings', 
               'Set-AzRecoveryServicesAsrNotificationSetting', 
               'Set-AzRecoveryServicesAsrVaultSettings', 
               'Start-ASRApplyRecoveryPoint', 'Start-ASRCancelFailover', 
               'Start-ASRCancelFailoverJob', 'Start-ASRCommitFailover', 
               'Start-ASRCommitFailoverJob', 'Start-ASRFO', 'Start-ASRPFO', 
               'Start-ASRPlannedFailoverJob', 
               'Start-ASRResynchronizeReplicationJob', 'Start-ASRResyncJob', 
               'Start-ASRSwitchAppliance', 'Start-ASRSwitchProcessServerJob', 
               'Start-ASRTestFailoverCleanupJob', 'Start-ASRTestFailoverJob', 
               'Start-ASRTFO', 'Start-ASRUnplannedFailoverJob', 'Stop-ASRJob', 
               'Update-ASRMobilityService', 'Update-ASRPolicy', 
               'Update-ASRProtectionContainerMapping', 
               'Update-ASRProtectionDirection', 'Update-ASRRecoveryPlan', 
               'Update-ASRServicesProvider', 'Update-ASRvCenter'

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
        Tags = 'Azure','ResourceManager','ARM','RecoveryServices'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Updated Restore-AzRecoveryServicesBackupItem to support 0 as a TargetZoneNumber to restore to NoZone.
* Updated Restore-AzRecoveryServicesBackupItem to block cross zonal restore from snapshot RP.'

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
# MIIoUQYJKoZIhvcNAQcCoIIoQjCCKD4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCuJ5pnfAXctT8C
# 88QDCHY21IxYi7xOsXW3Ff9ZoRAp26CCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGiIwghoeAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAQDvdWVXQ87GK0AAAAA
# BAMwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIEh1
# yb7tiL1siv9TdPRsundEx7GfxjQEYYEk6Q3wA5AoMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAGYN81866uM8XzuyHtTBp+1ahWJoeECNJpRbM
# KK3TnWcoG8c7xTwLa5ypyHPXX5amZbTZ8x5QMqp0lSy7Fx9v5C3HUwt8nkBjW10E
# tmgd1uuA0hrdaHNamJdJOB5oZ0EyzjtrhjyIfhu4U6oXTGrA8gJM28Le7MQjwUQb
# 0rbxbJXmKDOClTtKnERlp5LfRPD+FpF+rhniIOfjttjL62jZHrs1ntDitXPEXU7e
# 8h5McVVUDGLMvzXSjYmwfV/157iTUViuoUaM5Mml5Bed4SMAdH4tmRCRndkoN4Yz
# Hh6pFsrjgKAwv5LqbmJiWL2TkrSAw1W5W5jwlcJxzFX0GBdjjKGCF6wwgheoBgor
# BgEEAYI3AwMBMYIXmDCCF5QGCSqGSIb3DQEHAqCCF4UwgheBAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFZBgsqhkiG9w0BCRABBKCCAUgEggFEMIIBQAIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCAQz38ZLtTwoZ2omCNki/cuz/U9l0sLR6St
# EqBhymFUowIGZ7YzifkpGBIyMDI1MDIyNTA3MjExNC43N1owBIACAfSggdmkgdYw
# gdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjJEMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3Nv
# ZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIR+zCCBygwggUQoAMCAQICEzMAAAH9c/lo
# Ws0MYe0AAQAAAf0wDQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# UENBIDIwMTAwHhcNMjQwNzI1MTgzMTE2WhcNMjUxMDIyMTgzMTE2WjCB0zELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9z
# b2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxk
# IFRTUyBFU046MkQxQS0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCh
# Zaz4P467gmNidEdF527QxMVjM0kRU+cgvNzTZHepue6O+FmCSGn6n+XKZgvORDIb
# bOnFhx5OMgXseJBZu3oVbcBGQGu2ElTPTlmcqlwXfWWlQRvyBReIPbEimjxgz5IP
# RL6FM/VMID/B7fzJncES2Zm1xWdotGn8C+yqD7kojQrDpMMmkrBMuXRVbT/bewqK
# R5YNKcdB5Oms7TMib9u1qBJibdX/zNeV/HLuz8RUV1KCUcaxSrwRm6lQ7xdsfPPu
# 1RHKIPeQ7E2fDmjHV5lf9z9eZbgfpvjI2ZkXTBNm7DfvIDU8ko7JJKtetYSH4fr7
# 5Zvr7WW0wI+gwkdS08/cKfQI1w2+s/Im0NpyqOchOsvOuwd04uqOwfbb1mS+d2TQ
# irEENmAyhj4R/t98VE/ak+SsXUX0hwGRjPyEv5CNf67jLhSqrhS1PtVGeyq9H/H/
# 5AsTSlxISH9cTXDV9ynomarxGccReKTJwws39r8pjGlI/cV8Vstm5/6oivIUvSAQ
# PK1qkafU42NWSIqlU/a6pUhiPhWIKPLmktRx4x6qIqBiqGmZQcITZaywsuF1AEd2
# mXbz6T5ljqbh08WcSgZwke4xwhmfDhw7CLGiNE6v42rvVwmPtDgvRfA++5MdC3Sg
# ftEoxCCazLsJUPu/nl06F0dd1izI7r10B0r6daXJhwIDAQABo4IBSTCCAUUwHQYD
# VR0OBBYEFOkMxcDhlbz7Ivb7e8DpGZTugQqkMB8GA1UdIwQYMBaAFJ+nFV0AXmJd
# g/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0El
# MjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGlt
# ZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0l
# AQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUA
# A4ICAQBj2Fhf5PkCYKtgZof3pN1HlPnb8804bvJJh6im/h+WcNZAuEGWtq8CD6mO
# U2/ldJdmsoa/x7izl0nlZ2F8L3LAVCrhOZedR689e2W5tmT7TYFcrr/beEzRNIqz
# YqWFiKrNtF7xBsx8pcQO28ygdJlPuv7AjYiCNhDCRr7c/1VeARHC7jr9zPPwhH9m
# r687nnbcmV3qyxW7Oz27AismF9xgGPnSZdZEFwyHNqMuNYOByKHQO7KQ9wGmhMuU
# 4vwuleiiqev5AtgTgGlR6ncnJIxh8/PaF84veDTZYR+w7GnwA1tx2KozfV2be9KF
# 4SSaMcDbO4z5OCfiPmf4CfLsg4NhCQis1WEt0wvT167V0g+GnbiUW2dZNg1oVM58
# yoVrcBvwoMqJyanQC2FE1lWDQE8Avnz4HRRygEYrNL2OxzA5O7UmY2WKw4qRVRWR
# InkWj9y18NI90JNVohdcXuXjSTVwz9fY7Ql0BL3tPvyViO3D8/Ju7NfmyHEGH9Gp
# M+8LICEjEFUp83+F+zgIigVqpYnSv/xIHUIazLIhw98SAyjxx6rXDlmjQl+fIWLo
# a6j7Pcs8WX97FBpG5sSuwBRN/IFjn/mWLK+MCDINicQHy8c7tzsWDa0Z3mEaBiz4
# A6hbHbj5dzLGlSQBqMOGTL0OX7wllOO2zoFxP2xhOY6h2T9KAjCCB3EwggVZoAMC
# AQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNV
# BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4w
# HAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29m
# dCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIy
# NVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9
# DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2
# Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N
# 7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXc
# ag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJ
# j361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjk
# lqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37Zy
# L9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M
# 269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLX
# pyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLU
# HMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode
# 2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEA
# ATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYE
# FJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEB
# MEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# RG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEE
# AYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB
# /zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEug
# SaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9N
# aWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsG
# AQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jv
# b0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt
# 4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsP
# MeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++
# Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9
# QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2
# wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aR
# AfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5z
# bcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nx
# t67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3
# Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+AN
# uOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/Z
# cGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggNWMIICPgIBATCCAQGhgdmkgdYw
# gdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjJEMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3Nv
# ZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQCiPRa1VVBQ1Iqi
# q2uOKdECwFR2g6CBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MA0GCSqGSIb3DQEBCwUAAgUA62dJIDAiGA8yMDI1MDIyNDE5MzgwOFoYDzIwMjUw
# MjI1MTkzODA4WjB0MDoGCisGAQQBhFkKBAExLDAqMAoCBQDrZ0kgAgEAMAcCAQAC
# Ag3xMAcCAQACAhPBMAoCBQDraJqgAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisG
# AQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQELBQAD
# ggEBAJ18DBR9C5YfNjMAsNzzLgmLzLlamqcjel/NvqEQWualhtglKsuntsAZGKWW
# hn03phtKb/ZyUnxA8uA3udA5LF0EHM8vwW9y8FnwngI0iv3SJagoFIdFDeE2EgqY
# PLiyI7agLIa+pP0Yc8oZd3X2lRTtDRVIUahGMOMVcDcRJpRzwyniwNVe6DLXWjQf
# eY9PcQ3zp7/JPGqalaLH741P2yrSA0YFhKj/0O5gMSijQ1tRc4yl5jHGzFBnU7Pw
# hMhDIYOHyctw/U+sjLFqVlk1D//mGWKeXLpYYI5hK8KTOtGzGRCcJrB015L0sgD9
# e6LimW9uqZx42bbj1y6AmTVxaJMxggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBQQ0EgMjAxMAITMwAAAf1z+WhazQxh7QABAAAB/TANBglghkgBZQME
# AgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJ
# BDEiBCDV9mVaWOjPwV1tO9KqhA786ATxHC+/1AR7p4tjrD4TCDCB+gYLKoZIhvcN
# AQkQAi8xgeowgecwgeQwgb0EIIAoSA3JSjC8h/H94N9hK6keR4XWnoYXCMoGzyVE
# Hg1HMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH9
# c/loWs0MYe0AAQAAAf0wIgQgYwwSZbwBZkrx1yp1JzCeBOOWdZKgnhwvWqNvHkGk
# g+QwDQYJKoZIhvcNAQELBQAEggIAa6ZFxgaJ9QjiuKos11OhevqFvacsCgWcn1PU
# 7ho8R2eaBIiYE/Zwg3UnXXHZ9IpysQMu1xG0i3C3bNhb+YkE7pWQOLZc+TvpgzEj
# J99S3wC3ro7STXs7L54lrd/99aJVU/AtSDn2jdDa4v9xAuzwsE7aLi/I0bmTtvXn
# k9uON7NH2eyFsSoeQolCStiHAvLHuUGreZeAHHVKhbnehOgR6DiHxvQjszfmp++3
# KCqUu+QeCbFjeUiHiyDpVhRqodDtDDlhRxqQwvmQQjLmrrMc1sMvAtk4gvEMHGMG
# YqEW00WVV6G2p7E9FtOrmuncrap1xCgtlj7S+wmi9nwA0PRVnGun7MJAm6maZQl7
# jmS8axPJ2mDDFObtg/WYIRiSidxi5j3MJEmLXAma4JVT8XDicr/fYMdfrdjJVOTX
# osNs7eTmF6YZU+7gQyVxY7x7CfZ9nfKzRKfrcdJwuh2N1mavsQcs6iBHbULu3xm9
# SCk/13CVfnUeHqToLvS+ZoT0lDO2z4Kz1pQf0s6LuCjtBwiNlk/IVWuivj78pKh3
# iETZm+aEMNnQNE6IcIYCN1sEGXUyy+E4vguFDKBO4YjEurvvdNzfNPXVQEpJTOwM
# C4i4/xgFtlW9q8EYlQCK9teE3X7UoEXNQbq6dqY39SpC4wlKU9uAWSTSwRSEtqWb
# VjzVyzI=
# SIG # End signature block
