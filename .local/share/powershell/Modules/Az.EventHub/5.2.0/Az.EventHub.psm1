#
# Script module for module 'Az.EventHub' that is executed when 'Az.EventHub' is imported in a PowerShell session.
#
# Generated by: Microsoft Corporation
#
# Generated on: 02/06/2025 03:13:02
#

$PSDefaultParameterValues.Clear()
Set-StrictMode -Version Latest

function Test-DotNet
{
    try
    {
        if ((Get-PSDrive 'HKLM' -ErrorAction Ignore) -and (-not (Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\' -ErrorAction Stop | Get-ItemPropertyValue -ErrorAction Stop -Name Release | Where-Object { $_ -ge 461808 })))
        {
            throw ".NET Framework versions lower than 4.7.2 are not supported in Az. Please upgrade to .NET Framework 4.7.2 or higher."
        }
    }
    catch [System.Management.Automation.DriveNotFoundException]
    {
        Write-Verbose ".NET Framework version check failed."
    }
}

function Preload-Assembly {
    param (
        [string]
        $AssemblyDirectory
    )
    if($PSEdition -eq 'Desktop' -and (Test-Path $AssemblyDirectory -ErrorAction Ignore))
    {
        try
        {
            Get-ChildItem -ErrorAction Stop -Path $AssemblyDirectory -Filter "*.dll" | ForEach-Object {
                try
                {
                    Add-Type -Path $_.FullName -ErrorAction Ignore | Out-Null
                }
                catch {
                    Write-Verbose $_
                }
            }
        }
        catch {}
    }
}

if ($true -and ($PSEdition -eq 'Desktop'))
{
    if ($PSVersionTable.PSVersion -lt [Version]'5.1')
    {
        throw "PowerShell versions lower than 5.1 are not supported in Az. Please upgrade to PowerShell 5.1 or higher."
    }

    Test-DotNet
}

if ($true -and ($PSEdition -eq 'Core'))
{
    if ($PSVersionTable.PSVersion -lt [Version]'6.2.4')
    {
        throw "Current Az version doesn't support PowerShell Core versions lower than 6.2.4. Please upgrade to PowerShell Core 6.2.4 or higher."
    }
}

if (Test-Path -Path "$PSScriptRoot\StartupScripts" -ErrorAction Ignore)
{
    Get-ChildItem "$PSScriptRoot\StartupScripts" -ErrorAction Stop | ForEach-Object {
        . $_.FullName
    }
}

# [windows powershell] preload assemblies


# [windows powershell] preload module alc assemblies
$preloadPath = (Join-Path $PSScriptRoot -ChildPath "ModuleAlcAssemblies")
Preload-Assembly -AssemblyDirectory $preloadPath

if (Get-Module AzureRM.profile -ErrorAction Ignore)
{
    Write-Warning ("AzureRM.Profile already loaded. Az and AzureRM modules cannot be imported in the same session or used in the same script or runbook. If you are running PowerShell in an environment you control you can use the 'Uninstall-AzureRm' cmdlet to remove all AzureRm modules from your machine. " +
        "If you are running in Azure Automation, take care that none of your runbooks import both Az and AzureRM modules. More information can be found here: https://aka.ms/azps-migration-guide.")
    throw ("AzureRM.Profile already loaded. Az and AzureRM modules cannot be imported in the same session or used in the same script or runbook. If you are running PowerShell in an environment you control you can use the 'Uninstall-AzureRm' cmdlet to remove all AzureRm modules from your machine. " +
        "If you are running in Azure Automation, take care that none of your runbooks import both Az and AzureRM modules. More information can be found here: https://aka.ms/azps-migration-guide.")
}

$module = Get-Module Az.Accounts 
        if ($module -ne $null -and $module.Version -lt [System.Version]"4.0.2") 
{ 
    Write-Error "This module requires Az.Accounts version 4.0.2. An earlier version of Az.Accounts is imported in the current PowerShell session. Please open a new session before importing this module. This error could indicate that multiple incompatible versions of the Azure PowerShell cmdlets are installed on your system. Please see https://aka.ms/azps-version-error for troubleshooting information." -ErrorAction Stop 
} 
elseif ($module -eq $null) 
{ 
    Import-Module Az.Accounts -MinimumVersion 4.0.2 -Scope Global 
}
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath Microsoft.Azure.PowerShell.Cmdlets.EventHub.dll)


if (Test-Path -Path "$PSScriptRoot\PostImportScripts" -ErrorAction Ignore)
{
    Get-ChildItem "$PSScriptRoot\PostImportScripts" -ErrorAction Stop | ForEach-Object {
        . $_.FullName
    }
}

$FilteredCommands = @()

if ($Env:ACC_CLOUD -eq $null)
{
    $FilteredCommands | ForEach-Object {

        $existingDefault = $false
        foreach ($key in $global:PSDefaultParameterValues.Keys)
        {
            if ($_ -like "$key")
            {
                $existingDefault = $true
            }
        }

        if (!$existingDefault)
        {
            $global:PSDefaultParameterValues.Add($_,
                {
                    if ((Get-Command Get-AzContext -ErrorAction Ignore) -eq $null)
                    {
                        $context = Get-AzureRmContext
                    }
                    else
                    {
                        $context = Get-AzContext
                    }
                    if (($context -ne $null) -and $context.ExtendedProperties.ContainsKey("Default Resource Group")) {
                        $context.ExtendedProperties["Default Resource Group"]
                    }
                })
        }
    }
}



# SIG # Begin signature block
# MIIoVAYJKoZIhvcNAQcCoIIoRTCCKEECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCUkxYx/hZAnzEh
# 2bqoxK6wIsiTHbVid6e41tFynDHz0qCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGiUwghohAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAQDvdWVXQ87GK0AAAAA
# BAMwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIM2O
# yYIgsWTz9LPxSxZNE1LzOG+FSFIWPmHsXAHHSa5gMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAYsLxyFW0Tgk59JOi33u1KVlnrcocVbjPibGr
# lyUOxfygxIxSqo4IgbeBVXY1DWE4PoJyxuNh/uG35KLfil1XnD/Srpkoxb7+xxHk
# xMwTR8V5PqvKSuvLJ0CtqZ98Xh7XSxq6rZ3kgY55FQcxbGnRqXiQYL1flsLELfny
# zpLXHusGRIam8BsmncKcegMBFpAC6CTK/pZ/c1mrE4H7QhnlJMY+jA5YXTYKMGXb
# nIjj+NmIUgNGXpro3JzYXV3GRalabQMhrTZfXyBGOuvKXC0hZjE1R2+xmYZ4sUAN
# zaMiSKiuBEIpslNYSpgToARHjqDLUsPq8/5dn5Y/f7+wK9OU7qGCF68wgherBgor
# BgEEAYI3AwMBMYIXmzCCF5cGCSqGSIb3DQEHAqCCF4gwgheEAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCCYYsBzsL3ccHOJ1+Od1SGoilXQhvw5YUBr
# btWV57XT6gIGZ5qvnOWUGBMyMDI1MDIwNjAzMTkwNi45NzNaMASAAgH0oIHZpIHW
# MIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjo0QzFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEf0wggcoMIIFEKADAgECAhMzAAAB/xI4
# fPfBZdahAAEAAAH/MA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExOVoXDTI1MTAyMjE4MzExOVowgdMxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jv
# c29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVs
# ZCBUU1MgRVNOOjRDMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# yeiV0pB7bg8/qc/mkiDdJXnzJWPYgk9mTGeI3pzQpsyrRJREWcKYHd/9db+g3z4d
# U4VCkAZEXqvkxP5QNTtBG5Ipexpph4PhbiJKwvX+US4KkSFhf1wflDAY1tu9CQqh
# hxfHFV7vhtmqHLCCmDxhZPmCBh9/XfFJQIUwVZR8RtUkgzmN9bmWiYgfX0R+bDAn
# ncUdtp1xjGmCpdBMygk/K0h3bUTUzQHb4kPf2ylkKPoWFYn2GNYgWw8PGBUO0vTM
# KjYD6pLeBP0hZDh5P3f4xhGLm6x98xuIQp/RFnzBbgthySXGl+NT1cZAqGyEhT7L
# 0SdR7qQlv5pwDNerbK3YSEDKk3sDh9S60hLJNqP71iHKkG175HAyg6zmE5p3fONr
# 9/fIEpPAlC8YisxXaGX4RpDBYVKpGj0FCZwisiZsxm0X9w6ZSk8OOXf8JxTYWIqf
# RuWzdUir0Z3jiOOtaDq7XdypB4gZrhr90KcPTDRwvy60zrQca/1D1J7PQJAJObbi
# aboi12usV8axtlT/dCePC4ndcFcar1v+fnClhs9u3Fn6LkHDRZfNzhXgLDEwb6dA
# 4y3s6G+gQ35o90j2i6amaa8JsV/cCF+iDSGzAxZY1sQ1mrdMmzxfWzXN6sPJMy49
# tdsWTIgZWVOSS9uUHhSYkbgMxnLeiKXeB5MB9QMcOScCAwEAAaOCAUkwggFFMB0G
# A1UdDgQWBBTD+pXk/rT/d7E/0QE7hH0wz+6UYTAfBgNVHSMEGDAWgBSfpxVdAF5i
# XYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENB
# JTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRp
# bWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsF
# AAOCAgEAOSNN5MpLiyunm866frWIi0hdazKNLgRp3WZPfhYgPC3K/DNMzLliYQUA
# p6WtgolIrativXjOG1lIjayG9r6ew4H1n5XZdDfJ12DLjopap5e1iU/Yk0eutPyf
# OievfbsIzTk/G51+uiUJk772nVzau6hI2KGyGBJOvAbAVFR0g8ppZwLghT4z3mkG
# Zjq/O4Z/PcmVGtjGps2TCtI4rZjPNW8O4c/4aJRmYQ/NdW91JRrOXRpyXrTKUPe3
# kN8N56jpl9kotLhdvd89RbOsJNf2XzqbAV7XjV4caCglA2btzDxcyffwXhLu9HMU
# 3dLYTAI91gTNUF7BA9q1EvSlCKKlN8N10Y4iU0nyIkfpRxYyAbRyq5QPYPJHGA0T
# y0PD83aCt79Ra0IdDIMSuwXlpUnyIyxwrDylgfOGyysWBwQ/js249bqQOYPdpyOd
# gRe8tXdGrgDoBeuVOK+cRClXpimNYwr61oZ2/kPMzVrzRUYMkBXe9WqdSezh8tyt
# uulYYcRK95qihF0irQs6/WOQJltQX79lzFXE9FFln9Mix0as+C4HPzd+S0bBN3A3
# XRROwAv016ICuT8hY1InyW7jwVmN+OkQ1zei66LrU5RtAz0nTxx5OePyjnTaItTS
# Y4OGuGU1SXaH49JSP3t8yGYA/vorbW4VneeD721FgwaJToHFkOIwggdxMIIFWaAD
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
# 2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYIDWDCCAkACAQEwggEBoYHZpIHW
# MIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjo0QzFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAqROMbMS8JcUl
# cnPkwRLFRPXFspmggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDANBgkqhkiG9w0BAQsFAAIFAOtOaAowIhgPMjAyNTAyMDUyMjQzMjJaGA8yMDI1
# MDIwNjIyNDMyMlowdjA8BgorBgEEAYRZCgQBMS4wLDAKAgUA605oCgIBADAJAgEA
# AgETAgH/MAcCAQACAhKDMAoCBQDrT7mKAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwG
# CisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEL
# BQADggEBAGDGIvBALvqVI/HVWaJAdWDwqG6RKVzeqyMtDMSbEUvVdWHQLlgklrvr
# sGdFm7G186CcpBrYVQwGrRRkJuvbbqc3MpB9iQ5eBsMBzP2tZ6l+4b35Bej4keK+
# SeobfKuW3j9sWZYgtSj+pRbKrvqN/D+R/vJ5wwuRySJ2v8GCdcMz0hPeAvwXE48p
# w7xUbOZWnRpIhfzA4sVpofnQsVg5T8C3N/ogjfxZ3ZFe9QansSyDFHxX4mMPv1JW
# R1mzzxC/t4ePdUxiKSVWTHoDc4Ah4wIRJwIJX14OXFBL0OTgd2mRimdCIigEEKvD
# CYR790gsNoFy1PmUXaNxS6V/Pgno7kkxggQNMIIECQIBATCBkzB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAf8SOHz3wWXWoQABAAAB/zANBglghkgB
# ZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3
# DQEJBDEiBCAFyoHQzP24x+O778JhJSaaA40wF/CzW22Ra8j+5hjRnDCB+gYLKoZI
# hvcNAQkQAi8xgeowgecwgeQwgb0EIOQy777JAndprJwi4xPq8Dsk24xpU4jeoONI
# RXy6nKf9MIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMA
# AAH/Ejh898Fl1qEAAQAAAf8wIgQgtp3y/jTmQfPchqykegfKbtPlKxccfaSYMrDH
# hPHc7aYwDQYJKoZIhvcNAQELBQAEggIAmx6plHEzzpHIAwdl+oCPCTn0i+ng1lsw
# Zl52lmzPQ8AELsMWi79+c9H6fonu1SPLDj937h8O9xb5ZE4uFIU2n+iZGMu7rlmA
# InJo9ph6dgdAsTugx+sMNHnVVqY/WoaZAvOKJDGdBR5NljkLaMVdEr4kKIvFbaR8
# elefbFuMLR0tEJjr6wMGfOvh8S+5NGsLDN0EH8AZhU2Gla12pJ0MAXTPPokXCgIJ
# Vcdipko7gvO9lR0XbqMQXYIlT2568Or4ebzSKvgr4BK9r2jM3I5EMtTe7NdXHXu/
# y0gYw51w0tK87Yv2Vv5ZsPBgBdVjtDvbv8V8sFzvt/9mW8jSjQGmmwGLA4Vn/6k7
# HnYFDjMi/N87696wB0Q81f/UYrNeluvNwhDmkTijnNGWH1ZzuD+m0Phsnv8/CkPZ
# 9hRGutstnLZkyuSp9vngf4AChUqgFu6MPBPBTFxOnhdvMlya8dn06vFLioBOfRgq
# GMY4JcC1Y91f3Fu7oYpWXvy+oaBbChXyFD4viXe5NccQK5wSzwlhdod0moT3IyAw
# 8L5ndTAyUn33H+usPUN5MjzyzgEtKjWqLkodIsr+IPrzjNCS/OSLhyLleuSzPnpK
# 9YQ8yOq5bD0yG78uO4kMtE1yx8k7bO8K0jOUVXJQ6ArMVzbZHz36hUY3fqwOhimY
# YgWXT3eCVF4=
# SIG # End signature block
