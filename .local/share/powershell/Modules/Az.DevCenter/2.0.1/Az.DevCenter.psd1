#
# Module manifest for module 'Az.DevCenter'
#
# Generated by: Microsoft Corporation
#
# Generated on: 1/9/2025
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Az.DevCenter.psm1'

# Version number of this module.
ModuleVersion = '2.0.1'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = 'accceef6-8113-453a-a31c-4f2ce57893d6'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell: DevCenter cmdlets'

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
RequiredAssemblies = 'DevCenter.AutoRest/bin/Az.DevCenter.private.dll', 
               'DevCenterData.AutoRest/bin/Az.DevCenterdata.private.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'DevCenter.AutoRest/Az.DevCenter.format.ps1xml', 
               'DevCenterData.AutoRest/Az.DevCenterdata.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('DevCenter.AutoRest/Az.DevCenter.psm1', 'DevCenterData.AutoRest/Az.DevCenterdata.psm1')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Connect-AzDevCenterAdminCatalog', 
               'Connect-AzDevCenterAdminProjectCatalog', 
               'Deploy-AzDevCenterUserEnvironment', 
               'Get-AzDevCenterAdminAttachedNetwork', 
               'Get-AzDevCenterAdminCatalog', 
               'Get-AzDevCenterAdminCatalogSyncErrorDetail', 
               'Get-AzDevCenterAdminCustomizationTask', 
               'Get-AzDevCenterAdminCustomizationTaskErrorDetail', 
               'Get-AzDevCenterAdminDevBoxDefinition', 
               'Get-AzDevCenterAdminDevCenter', 
               'Get-AzDevCenterAdminEnvironmentDefinition', 
               'Get-AzDevCenterAdminEnvironmentDefinitionErrorDetail', 
               'Get-AzDevCenterAdminEnvironmentType', 
               'Get-AzDevCenterAdminGallery', 'Get-AzDevCenterAdminImage', 
               'Get-AzDevCenterAdminImageVersion', 
               'Get-AzDevCenterAdminNetworkConnection', 
               'Get-AzDevCenterAdminNetworkConnectionHealthDetail', 
               'Get-AzDevCenterAdminNetworkConnectionOutboundNetworkDependencyEndpoint', 
               'Get-AzDevCenterAdminOperationStatus', 'Get-AzDevCenterAdminPlan', 
               'Get-AzDevCenterAdminPlanMember', 'Get-AzDevCenterAdminPool', 
               'Get-AzDevCenterAdminProject', 
               'Get-AzDevCenterAdminProjectAllowedEnvironmentType', 
               'Get-AzDevCenterAdminProjectCatalog', 
               'Get-AzDevCenterAdminProjectCatalogSyncErrorDetail', 
               'Get-AzDevCenterAdminProjectEnvironmentDefinition', 
               'Get-AzDevCenterAdminProjectEnvironmentDefinitionErrorDetail', 
               'Get-AzDevCenterAdminProjectEnvironmentType', 
               'Get-AzDevCenterAdminProjectInheritedSetting', 
               'Get-AzDevCenterAdminSchedule', 'Get-AzDevCenterAdminSku', 
               'Get-AzDevCenterAdminUsage', 'Get-AzDevCenterUserCatalog', 
               'Get-AzDevCenterUserDevBox', 'Get-AzDevCenterUserDevBoxAction', 
               'Get-AzDevCenterUserDevBoxCustomizationGroup', 
               'Get-AzDevCenterUserDevBoxCustomizationTaskDefinition', 
               'Get-AzDevCenterUserDevBoxCustomizationTaskLog', 
               'Get-AzDevCenterUserDevBoxOperation', 
               'Get-AzDevCenterUserDevBoxRemoteConnection', 
               'Get-AzDevCenterUserEnvironment', 
               'Get-AzDevCenterUserEnvironmentAction', 
               'Get-AzDevCenterUserEnvironmentDefinition', 
               'Get-AzDevCenterUserEnvironmentLog', 
               'Get-AzDevCenterUserEnvironmentOperation', 
               'Get-AzDevCenterUserEnvironmentOutput', 
               'Get-AzDevCenterUserEnvironmentType', 'Get-AzDevCenterUserPool', 
               'Get-AzDevCenterUserProject', 'Get-AzDevCenterUserSchedule', 
               'Invoke-AzDevCenterAdminExecuteCheckNameAvailability', 
               'Invoke-AzDevCenterAdminExecuteCheckScopedNameAvailability', 
               'Invoke-AzDevCenterUserDelayDevBoxAction', 
               'Invoke-AzDevCenterUserDelayEnvironmentAction', 
               'New-AzDevCenterAdminAttachedNetwork', 
               'New-AzDevCenterAdminCatalog', 
               'New-AzDevCenterAdminDevBoxDefinition', 
               'New-AzDevCenterAdminDevCenter', 
               'New-AzDevCenterAdminEnvironmentType', 
               'New-AzDevCenterAdminGallery', 
               'New-AzDevCenterAdminNetworkConnection', 'New-AzDevCenterAdminPlan', 
               'New-AzDevCenterAdminPlanMember', 'New-AzDevCenterAdminPool', 
               'New-AzDevCenterAdminProject', 'New-AzDevCenterAdminProjectCatalog', 
               'New-AzDevCenterAdminProjectEnvironmentType', 
               'New-AzDevCenterAdminSchedule', 'New-AzDevCenterUserDevBox', 
               'New-AzDevCenterUserDevBoxCustomizationGroup', 
               'New-AzDevCenterUserEnvironment', 
               'Remove-AzDevCenterAdminAttachedNetwork', 
               'Remove-AzDevCenterAdminCatalog', 
               'Remove-AzDevCenterAdminDevBoxDefinition', 
               'Remove-AzDevCenterAdminDevCenter', 
               'Remove-AzDevCenterAdminEnvironmentType', 
               'Remove-AzDevCenterAdminGallery', 
               'Remove-AzDevCenterAdminNetworkConnection', 
               'Remove-AzDevCenterAdminPlan', 'Remove-AzDevCenterAdminPlanMember', 
               'Remove-AzDevCenterAdminPool', 'Remove-AzDevCenterAdminProject', 
               'Remove-AzDevCenterAdminProjectCatalog', 
               'Remove-AzDevCenterAdminProjectEnvironmentType', 
               'Remove-AzDevCenterAdminSchedule', 'Remove-AzDevCenterUserDevBox', 
               'Remove-AzDevCenterUserEnvironment', 'Repair-AzDevCenterUserDevBox', 
               'Restart-AzDevCenterUserDevBox', 'Skip-AzDevCenterUserDevBoxAction', 
               'Skip-AzDevCenterUserEnvironmentAction', 
               'Start-AzDevCenterAdminNetworkConnectionHealthCheck', 
               'Start-AzDevCenterAdminPoolHealthCheck', 
               'Start-AzDevCenterUserDevBox', 'Stop-AzDevCenterUserDevBox', 
               'Sync-AzDevCenterAdminCatalog', 
               'Sync-AzDevCenterAdminProjectCatalog', 
               'Test-AzDevCenterUserDevBoxCustomizationTaskAction', 
               'Update-AzDevCenterAdminCatalog', 
               'Update-AzDevCenterAdminDevBoxDefinition', 
               'Update-AzDevCenterAdminDevCenter', 
               'Update-AzDevCenterAdminEnvironmentType', 
               'Update-AzDevCenterAdminNetworkConnection', 
               'Update-AzDevCenterAdminPlan', 'Update-AzDevCenterAdminPlanMember', 
               'Update-AzDevCenterAdminPool', 'Update-AzDevCenterAdminProject', 
               'Update-AzDevCenterAdminProjectCatalog', 
               'Update-AzDevCenterAdminProjectEnvironmentType', 
               'Update-AzDevCenterAdminSchedule', 
               'Update-AzDevCenterUserEnvironment'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @(@{ModuleName = 'Az.Accounts'; ModuleVersion = '4.0.1'; })

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Azure','ResourceManager','ARM','PSModule','DevCenter'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Upgraded nuget package to signed package.'

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
# MIIoQQYJKoZIhvcNAQcCoIIoMjCCKC4CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC30EkVPhm4wiwo
# IYA1Qh/eRkfrT7lMM0OhzXoFihzNEaCCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
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
# /Xmfwb1tbWrJUnMTDXpQzTGCGiEwghodAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAQEbHQG/1crJ3IAAAAABAQwDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIGFafDq3aI8xDS+OiicFT/eN
# pTB4vaOFxVCZktPMlh8XMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAZ9NMQBiRwkKgyc5IrXQltKVmR3g34Fbqh9he1XYqJ4PrJSxR+5wxGGoG
# 2ipln+7GBKRIYLSAHimPKkv1/T3L6smuNFk+AcUIiuGhKlHYumcbcfMaXJ+b7J1b
# 8EDIi6ECBrK+k0CsadgwhQC2o4c25VR1+KvbIJE3J6tjews4Ec4kn7uPTZTmeY+9
# pv7CJpbkRD7l1pfysLTuRM4QjbV8OCuXC995KA+jSxTzAmLfi7aVfi1Emwh/Mvkk
# XXcfnKqbhNfaNrbrTaL0+yyOqJFiDoR84OH62gCZoKPB1a+XzsfkiElpEXQzZNzY
# xdRt2bb7H/on4ArexUkCsbA3Z7IZD6GCF6swghenBgorBgEEAYI3AwMBMYIXlzCC
# F5MGCSqGSIb3DQEHAqCCF4QwgheAAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFYBgsq
# hkiG9w0BCRABBKCCAUcEggFDMIIBPwIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCAd5tYO1RIdbPe3D4a+F/5Als+c2n4a4c1GmHNAG+7qWAIGZ2LPyGS1
# GBEyMDI1MDEwOTA3MjEzOS42WjAEgAIB9KCB2aSB1jCB0zELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxh
# bmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046
# NDAxQS0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
# cnZpY2WgghH7MIIHKDCCBRCgAwIBAgITMwAAAf7QqMJ7NCELAQABAAAB/jANBgkq
# hkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yNDA3
# MjUxODMxMThaFw0yNTEwMjIxODMxMThaMIHTMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVy
# YXRpb25zIExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo0MDFBLTA1
# RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCC
# AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALy8IRcVpagON6JbBODwnoGe
# Jkn7B9mE0ihGL/Bp99+tgZmsnHX+U97UMaT9zVputmB1IniEF8PtLuKpWsuADdyK
# JyPuOzaYvX6OdsXQFzF9KRq3NHqlvEVjd2381zyr9OztfIth4w8i7ssGMigPRZlm
# 3j42oX/TMHfEIMoJD7cA61UBi8jpMjN1U4hyqoRrvQQhlUXR1vZZjzK61JT1omFf
# S1QgeVWHfgBFLXX6gHapc1cQOdxIMUqoaeiW3xCp03XHz+k/DIq9B68E07Vdodsg
# wbY120CGqsnCjm+t9xn0ZJ9teizgwYN+z/8cIaHV0/NWQtmhze3sRA5pm4lrLIxr
# xSZJYtoOnbdNXkoTohpoW6J69Kl13AXqjW+kKBfI1/7g1bWPaby+I/GhFkuPYSlB
# 9Js7ArnCK8FEvsfDLk9Ln+1VwhTRW4glDUU6H8SdweOeHhiYS9H8FE0W4Mgm6S4C
# jCg4gkbm+uQ4Wng71AACU/dykgqHhQqJJT2r24EMmoRmQy/71gFY1+W/Cc4ZcvYB
# gnSv6ouovnMWdEvMegdsoz22X3QVXx/zQaf9S5+8W3jhEwDp+zk/Q91BrdKviolo
# GONh5y48oZdWwLuR34K8gDtwwmiHVdrY75CWstqjpxew4I/GutCkE/UIHyX8F569
# 2Som2DI2lGwjSA58c9spAgMBAAGjggFJMIIBRTAdBgNVHQ4EFgQUb857ifUlNoOZ
# f+f2/uQgYm2xxd0wHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYD
# VR0fBFgwVjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9j
# cmwvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwG
# CCsGAQUFBwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIw
# MjAxMCgxKS5jcnQwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcD
# CDAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAIk+DVLztpcPtHQz
# LbAbsZl9qN5VUKp0JLiEwBiBgoCPrJe2amTkw3fC6sbB+Blgj087XN7a/AIAb7GC
# M1oxcIqAowkDg6taATFjcxLCs3JB8QM2KOUs3uzj5DANwwMVauEkkfMvk0QthnDn
# dCUXmdZT5YZT5fVyPs/DoLTj5kJyy4j/as6Ux8Bc3vrG6kp/HHpHbjGXS8hyZNzY
# sNwJ4JVP1k8xrEAHXIfUlVeCx4n1J5sE39ItO4irU5TZKt28dYsloOze4xmQAUVk
# 9pl/mAFR5Stu7fZ/lrWG5+nDiTV+i7B/MT1QUWACEVZFrDMhAHaD/Xan2mc8Fxpo
# 7lUPd9TYcx44xvhH8NdfA145N1at6lCNa3t+MzDE0c2WRMPNhbqRd74lzUdw1TpU
# vSR+MeXpnyDWtbrkmnOheAniQg9RmpH0uw+WsjbGmdnvrAVIetilU5YRLEER2UcA
# k8W4sdWOIicPjwzS3NB39fal9l4l9LtkjPQlk047M/UrwoyCksQmRQjb/86SiJbB
# 8e4UDUB0jGyodP8MJ/OroiACxI2s1LMxNPl+q3Dmw31OIfzv9L5mxdwTEfuOawGT
# ABEybEQz8RyQqP+VxoVnYPy6CeV1gazgy+OGDazexUZxxAAK9OrH5amfHnldxbgy
# nT+YdfVlJxlsDtR/2Y1MzqFRold4MIIHcTCCBVmgAwIBAgITMwAAABXF52ueAptJ
# mQAAAAAAFTANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNh
# dGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEwOTMwMTgyMjI1WhcNMzAwOTMwMTgzMjI1
# WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCCAiIwDQYJKoZIhvcNAQEB
# BQADggIPADCCAgoCggIBAOThpkzntHIhC3miy9ckeb0O1YLT/e6cBwfSqWxOdcjK
# NVf2AX9sSuDivbk+F2Az/1xPx2b3lVNxWuJ+Slr+uDZnhUYjDLWNE893MsAQGOhg
# fWpSg0S3po5GawcU88V29YZQ3MFEyHFcUTE3oAo4bo3t1w/YJlN8OWECesSq/XJp
# rx2rrPY2vjUmZNqYO7oaezOtgFt+jBAcnVL+tuhiJdxqD89d9P6OU8/W7IVWTe/d
# vI2k45GPsjksUZzpcGkNyjYtcI4xyDUoveO0hyTD4MmPfrVUj9z6BVWYbWg7mka9
# 7aSueik3rMvrg0XnRm7KMtXAhjBcTyziYrLNueKNiOSWrAFKu75xqRdbZ2De+JKR
# Hh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9fvzZnkXftnIv231fgLrbqn427DZM9itu
# qBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdHGO2n6Jl8P0zbr17C89XYcz1DTsEzOUyO
# ArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7XKHYC4jMYctenIPDC+hIK12NvDMk2ZItb
# oKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiER9vcG9H9stQcxWv2XFJRXRLbJbqvUAV6
# bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/eKtFtvUeh17aj54WcmnGrnu3tz5q4i6t
# AgMBAAGjggHdMIIB2TASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQW
# BBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAdBgNVHQ4EFgQUn6cVXQBeYl2D9OXSZacb
# UzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEEAYI3TIN9AQEwQTA/BggrBgEFBQcCARYz
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnku
# aHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIA
# QwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2
# VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwu
# bWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEw
# LTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93
# d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYt
# MjMuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQCdVX38Kq3hLB9nATEkW+Geckv8qW/q
# XBS2Pk5HZHixBpOXPTEztTnXwnE2P9pkbHzQdTltuw8x5MKP+2zRoZQYIu7pZmc6
# U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gngugnue99qb74py27YP0h1AdkY3m2CDPVt
# I1TkeFN1JFe53Z/zjj3G82jfZfakVqr3lbYoVSfQJL1AoL8ZthISEV09J+BAljis
# 9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHCgRlCGVJ1ijbCHcNhcy4sa3tuPywJeBTp
# kbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6MhrZlvSP9pEB9s7GdP32THJvEKt1MMU0
# sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEUBHG/ZPkkvnNtyo4JvbMBV0lUZNlz138e
# W0QBjloZkWsNn6Qo3GcZKCS6OEuabvshVGtqRRFHqfG3rsjoiV5PndLQTHa1V1QJ
# sWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+fpO+y/g75LcVv7TOPqUxUYS8vwLBgqJ7
# Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrpNPgkNWcr4A245oyZ1uEi6vAnQj0llOZ0
# dFtq0Z4+7X6gMTN9vMvpe784cETRkPHIqzqKOghif9lwY1NNje6CbaUFEMFxBmoQ
# tB1VM1izoXBm8qGCA1YwggI+AgEBMIIBAaGB2aSB1jCB0zELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxh
# bmQgT3BlcmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046
# NDAxQS0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
# cnZpY2WiIwoBATAHBgUrDgMCGgMVAIRjRw/2u0NG0C1lRvSbhsYC0V7HoIGDMIGA
# pH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQELBQAC
# BQDrKaWNMCIYDzIwMjUwMTA5MDEzMTU3WhgPMjAyNTAxMTAwMTMxNTdaMHQwOgYK
# KwYBBAGEWQoEATEsMCowCgIFAOsppY0CAQAwBwIBAAICEaUwBwIBAAICEugwCgIF
# AOsq9w0CAQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQAC
# AwehIKEKMAgCAQACAwGGoDANBgkqhkiG9w0BAQsFAAOCAQEAByMIMCX2yBnQAYRQ
# NOtn0k/3G1ZURxq6nJkuzzV5e9v3syEEFs+k+iY8pvrtg8+tNpgvTduo3wxvpACI
# q+jWCXVRZfSrdWkpY0fMr4FJGGsGB0dodxCt3zi6RA766Osh3whS0414jkxoh1y0
# ppSPL8iRNGGhBl/TZ4Smak6YaRUOOLr6OcPKeJc09XZYJOAKAQvp8I7c3ehbax3J
# WAgp2fJK/KjE860ySKV1/nZdBxxzK5XRjmQyNWJVdkb1kNosRsrcUDVJrhSHMTQe
# 9786uGoxPXQV2J/uFfmC6UUWrkzkk3mA9diIu1KpjtMCBzjZsLWS/QeQ/yCRVX0C
# HEb6WjGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# AhMzAAAB/tCowns0IQsBAAEAAAH+MA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG
# 9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIMbez7BZF26AFPQL
# QxawlpiJ/m9dr8SZIcRcGTdNxT69MIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCB
# vQQgEYXM3fxTyJ8Y0fdptoT1qnPrxjhtfvyNFrZArLcodHkwgZgwgYCkfjB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAf7QqMJ7NCELAQABAAAB/jAi
# BCBqFoMLQtCFGpDiqDCRHG7YKb6rqLN10f+udAaQRv/cTjANBgkqhkiG9w0BAQsF
# AASCAgCx7tfr4q84gb3+P2s+DbuN/MuiN23nSLuUr1nsWZKM2Q6yWnatI88ytl3b
# SH06FaU7+NDV32G0LD7ixdXYVlXpr1A235ExfT0+9q7pi3e2eoDxDK9eATaRkBnk
# sGrlYQss2LK6HjUjzpvmlInwiiONc1Xzl5+4Npkt5cH6A/TE4sO5/OXwaFbBBPjg
# yy4ApQYKKh7pj9lqHcAX5Y4PYVJhjA8RiAP0hd9gZEq2dSOSijEJCMi94qQHCYZx
# u4ABI/vbqA7tymZ0p/7pSo0tFwcj/Q5bSG4+8r1c6GIoSMyP+eoWVX60psj04JoA
# 8DiQ8m7E5g19L+auzO1QEQnPYDdSnMeYM0u3T5kYUiSuVgpIoZSz1NypmOdfGisc
# bopRuaqy723aY1RvaBX4pDrmGkMsq5R1agRnwYbh4cKTKHkmpnxVDuaZIW+MsbM4
# 7TVKpi90GNKIF7paf48fvFjId5L7JNeunymTGTHB4jbbTQXLEK81BOkwROo65uk4
# v2NcIgYEcJxEgJi8cLhHmGcF2YzmeouhtwU2B5t3AETuvqCT1lt04bcEY5aZs2td
# 701fmh89yX+xmvt/uC6Oiws+F4AMJaeXPc1MrwQGTg7mkAVjyBjUbjBXAzI0lpmM
# E+pfkBCkK7gOje6mdRHz1rptYMu2MHQ7JQZiJgi+qaaog+XeEA==
# SIG # End signature block
