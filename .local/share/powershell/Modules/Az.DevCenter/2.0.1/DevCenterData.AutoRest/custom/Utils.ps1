function GetEndpointFromResourceGraph {
    [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory, HelpMessage = 'Name of the dev center')]
        [System.String]
        ${DevCenterName},

        [Parameter(HelpMessage = 'Name of the project')]
        [System.String]
        ${Project}


    ) 

    process {
        $module = Get-Module -ListAvailable | Where-Object { $_.Name -eq "Az.ResourceGraph" }
        if (!$module) {
            $noModuleFoundMessage = "Az.ResourceGraph Module must be installed to run this command. " `
                + "Please run 'Install-Module -Name Az.ResourceGraph' to install and continue."
            Write-Error $noModuleFoundMessage -ErrorAction Stop
        }

        $query = "Resources |where type =~'Microsoft.devcenter/projects' "
        if ($Project) {
            $query += "| where name =~ '$Project' "
        }
        $query += "| extend devCenterArr = split(properties.devCenterId, '/') " `
            + "| extend devCenterName = devCenterArr[array_length(devCenterArr) -1]  "`
            + "| where devCenterName =~ '$DevCenterName' | take 1 "`
            + "| extend devCenterUri = properties.devCenterUri | project devCenterUri"
        $argResponse = Az.ResourceGraph\Search-AzGraph -Query $query
        $devCenterUri = $argResponse.devCenterUri
        if (!$devCenterUri) {
            $azContext = Get-AzContext
            $tenantId = $azContext.Tenant.Id
            $errorHelp = "under the current tenant '$tenantId'. Please contact your admin to gain access to specific projects or " +
            "use a different tenant where you have access to projects."
            if (!$Project) {
                $noProjectFound = "No projects were found in the dev center '$DevCenterName' " + $errorHelp
                Write-Error $noProjectFound -ErrorAction Stop
            }
            else {
                $noProjectFound = "No project '$Project' was found in the dev center '$DevCenterName' " + $errorHelp
                Write-Error $noProjectFound -ErrorAction Stop
            }
        }
        return $devCenterUri.Substring(0, $devCenterUri.Length - 1)
    }
}

function GetDelayedActionTimeFromAllActions {
    [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'Endpoint URL')]
        [System.String]
        ${Endpoint},

        [Parameter(Mandatory = $true, HelpMessage = 'Name of the project')]
        [System.String]
        ${Project},

        [Parameter(Mandatory = $true, HelpMessage = 'Name of the dev box')]
        [System.String]
        ${DevBoxName},

        [Parameter(Mandatory)]
        [System.TimeSpan]
        ${DelayTime},

        [Parameter(HelpMessage = 'User id')]
        [System.String]
        ${UserId}

    ) 

    process {
        $action = Az.DevCenterdata.internal\Get-AzDevCenterUserDevBoxAction -Endpoint $Endpoint -ProjectName `
            $Project -DevBoxName $DevBoxName -UserId $UserId | ConvertTo-Json | ConvertFrom-Json

        if (!$action) {
            $action = "No actions were found."
            Write-Error $action -ErrorAction Stop
        }
        
        $excludedDate = [DateTime]::ParseExact("0001-01-01T00:00:00.0000000", "yyyy-MM-ddTHH:mm:ss.fffffff", $null)
        $actionWithEarliestScheduledTime = $action |
        Where-Object { $null -ne $_.NextScheduledTime -and $_.NextScheduledTime -ne $excludedDate } |
        Sort-Object NextScheduledTime | Select-Object -First 1



        $newScheduledTime = $actionWithEarliestScheduledTime.NextScheduledTime + $DelayTime

        return $newScheduledTime
    }
}
function GetDelayedActionTimeFromActionName {
    [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the action')]
        [System.String]
        ${Name},

        [Parameter(Mandatory = $true, HelpMessage = 'Endpoint URL')]
        [System.String]
        ${Endpoint},

        [Parameter(Mandatory = $true, HelpMessage = 'Name of the project')]
        [System.String]
        ${Project},

        [Parameter(Mandatory = $true, HelpMessage = 'Name of the dev box')]
        [System.String]
        ${DevBoxName},

        [Parameter(Mandatory)]
        [System.TimeSpan]
        ${DelayTime},

        [Parameter(HelpMessage = 'User id')]
        [System.String]
        ${UserId}
        
    ) 

    process {
        $action = Az.DevCenterdata.internal\Get-AzDevCenterUserDevBoxAction -Endpoint $Endpoint -Name $Name `
            -ProjectName $Project -DevBoxName $DevBoxName -UserId $UserId | ConvertTo-Json | ConvertFrom-Json
        
        $newScheduledTime = $action.NextScheduledTime + $DelayTime

        return $newScheduledTime
    }
}

function GetDelayedEnvironmentActionTimeFromActionName {
    [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the action')]
        [System.String]
        ${Name},

        [Parameter(Mandatory = $true, HelpMessage = 'Endpoint URL')]
        [System.String]
        ${Endpoint},

        [Parameter(Mandatory = $true, HelpMessage = 'Name of the project')]
        [System.String]
        ${Project},

        [Parameter(Mandatory = $true, HelpMessage = 'Name of the environment')]
        [System.String]
        ${EnvironmentName},

        [Parameter(Mandatory)]
        [System.TimeSpan]
        ${DelayTime},

        [Parameter(HelpMessage = 'User id')]
        [System.String]
        ${UserId}
        
    ) 

    process {
        $action = Az.DevCenterdata.internal\Get-AzDevCenterUserEnvironmentAction -Endpoint $Endpoint -Name $Name `
            -ProjectName $Project -EnvironmentName $EnvironmentName -UserId $UserId | ConvertTo-Json | ConvertFrom-Json
        
        $newScheduledTime = $action.NextScheduledTime + $DelayTime

        return $newScheduledTime
    }
}

function ValidateAndProcessEndpoint {
    [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.DoNotExportAttribute()]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'Endpoint URL')]
        [System.String]
        ${Endpoint}     
    ) 

    process {
        $regex = "(https)://.+.*\.(devcenter.azure-test.net|devcenter.azure.com)[/]?$"
        if ($Endpoint -notmatch $regex) {
            $incorrectEndpoint = "The endpoint $Endpoint is invalid. Please ensure that the " `
                + "endpoint starts with 'https' and is properly formatted. Use " +
            "'Get-AzDevCenterAdminProject' to view the endpoint of a specific project. " +
            "Contact your admin for further assistance."

            Write-Error $incorrectEndpoint -ErrorAction Stop
        }

        if ($Endpoint.EndsWith("/")) {
            return $Endpoint.Substring(0, $Endpoint.Length - 1)
        }

        return $Endpoint

    }
}
# SIG # Begin signature block
# MIIoKgYJKoZIhvcNAQcCoIIoGzCCKBcCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDuOav8KtFU3ZEv
# H7I3bMW60Dinzg/7XXHxNO6V+HWK3qCCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
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
# /Xmfwb1tbWrJUnMTDXpQzTGCGgowghoGAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAQEbHQG/1crJ3IAAAAABAQwDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIG+0v7tnzD+/FSq+jODsfE55
# lQj3qOLPbnno3pr0eCIiMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAOfgeWvQhOG1wPPUKWN2DhiQj42taMWopJUL4CeSMy/aazGgclHSYUQ0M
# w32g3mMN7Gnw3BX2LTxn6lvYvmSbvMyRkH9U2kYm2bYCjsHIUtxpCbppz/tWMPzu
# 5HXDBGmGQnCKs8cJrWYq57JHvjeTWS7TF34Cu6STteUX2iM1jHblNqh662eeG/nc
# LVeU5Je+dlmHIJ1UOYoFDsP3w+BQViWdgHL2mtX/W92/V7zrDZIMfi9Jf/TXpj0s
# 8U3mcJjbVf7CtvlFWZUjKQpX+KVh3dbrTNUT7GzYy27YQAkz0Y/ZICHLvJ5UILb1
# QAHa2rQ4A74rxIfuMV0mcaLrvIlx6KGCF5QwgheQBgorBgEEAYI3AwMBMYIXgDCC
# F3wGCSqGSIb3DQEHAqCCF20wghdpAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFSBgsq
# hkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCCFqstmjezlNlzkysquEMD76w3kTYKLuX4RrJVC2aq7wwIGZ2f84IGG
# GBMyMDI1MDEwOTA2MzY0NC4yNjFaMASAAgH0oIHRpIHOMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046MzcwMy0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghHqMIIHIDCCBQigAwIBAgITMwAAAeqaJHLVWT9hYwABAAAB6jANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzEyMDYxODQ1
# MzBaFw0yNTAzMDUxODQ1MzBaMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046MzcwMy0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQC1C1/xSD8gB9X7Ludoo2rWb2ksqaF65QtJkbQpmsc6
# G4bg5MOv6WP/uJ4XOJvKX/c1t0ej4oWBqdGD6VbjXX4T0KfylTulrzKtgxnxZh7q
# 1uD0Dy/w5G0DJDPb6oxQrz6vMV2Z3y9ZxjfZqBnDfqGon/4VDHnZhdas22svSC5G
# HywsQ2J90MM7L4ecY8TnLI85kXXTVESb09txL2tHMYrB+KHCy08ds36an7IcOGfR
# mhHbFoPa5om9YGpVKS8xeT7EAwW7WbXL/lo5p9KRRIjAlsBBHD1TdGBucrGC3TQX
# STp9s7DjkvvNFuUa0BKsz6UiCLxJGQSZhd2iOJTEfJ1fxYk2nY6SCKsV+VmtV5ai
# PzY/sWoFY542+zzrAPr4elrvr9uB6ci/Kci//EOERZEUTBPXME/ia+t8jrT2y3ug
# 15MSCVuhOsNrmuZFwaRCrRED0yz4V9wlMTGHIJW55iNM3HPVJJ19vOSvrCP9lsEc
# EwWZIQ1FCyPOnkM1fs7880dahAa5UmPqMk5WEKxzDPVp081X5RQ6HGVUz6ZdgQ0j
# cT59EG+CKDPRD6mx8ovzIpS/r/wEHPKt5kOhYrjyQHXc9KHKTWfXpAVj1Syqt5X4
# nr+Mpeubv+N/PjQEPr0iYJDjSzJrqILhBs5pytb6vyR8HUVMp+mAA4rXjOw42vkH
# fQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFCuBRSWiUebpF0BU1MTIcosFblleMB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQAog61WXj9+/nxVbX3G37KgvyoNAnuu2w3H
# oWZj3H0YCeQ3b9KSZThVThW4iFcHrKnhFMBbXJX4uQI53kOWSaWCaV3xCznpRt3c
# 4/gSn3dvO/1GP3MJkpJfgo56CgS9zLOiP31kfmpUdPqekZb4ivMR6LoPb5HNlq0W
# bBpzFbtsTjNrTyfqqcqAwc6r99Df2UQTqDa0vzwpA8CxiAg2KlbPyMwBOPcr9hJT
# 8sGpX/ZhLDh11dZcbUAzXHo1RJorSSftVa9hLWnzxGzEGafPUwLmoETihOGLqIQl
# Cpvr94Hiak0Gq0wY6lduUQjk/lxZ4EzAw/cGMek8J3QdiNS8u9ujYh1B7NLr6t3I
# glfScDV3bdVWet1itTUoKVRLIivRDwAT7dRH13Cq32j2JG5BYu/XitRE8cdzaJmD
# VBzYhlPl9QXvC+6qR8I6NIN/9914bTq/S4g6FF4f1dixUxE4qlfUPMixGr0Ft4/S
# 0P4fwmhs+WHRn62PB4j3zCHixKJCsRn9IR3ExBQKQdMi5auiqB6xQBADUf+F7hSK
# ZfbA8sFSFreLSqhvj+qUQF84NcxuaxpbJWVpsO18IL4Qbt45Cz/QMa7EmMGNn7a8
# MM3uTQOlQy0u6c/jq111i1JqMjayTceQZNMBMM5EMc5Dr5m3T4bDj9WTNLgP8SFe
# 3EqTaWVMOTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
# hvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# MjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAy
# MDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25Phdg
# M/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPF
# dvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6
# GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBp
# Dco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50Zu
# yjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3E
# XzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0
# lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1q
# GFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ
# +QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PA
# PBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkw
# EgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxG
# NSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARV
# MFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAK
# BggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMC
# AYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvX
# zpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
# cGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYI
# KwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG
# 9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0x
# M7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmC
# VgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449
# xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wM
# nosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDS
# PeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2d
# Y3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxn
# GSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+Crvs
# QWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokL
# jzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL
# 6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggNN
# MIICNQIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEn
# MCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjM3MDMtMDVFMC1EOTQ3MSUwIwYDVQQD
# ExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQCJ
# 2x7cQfjpRskJ8UGIctOCkmEkj6CBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6ymMujAiGA8yMDI1MDEwODIzNDYw
# MloYDzIwMjUwMTA5MjM0NjAyWjB0MDoGCisGAQQBhFkKBAExLDAqMAoCBQDrKYy6
# AgEAMAcCAQACAilmMAcCAQACAhNMMAoCBQDrKt46AgEAMDYGCisGAQQBhFkKBAIx
# KDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZI
# hvcNAQELBQADggEBAD82DqrGKBeLyB/qhaHn5sL84B6jIvZs4S+TbOLtcyeb2OGU
# vJPQLbs2boWVY31xNu7YC+SO5o3vMRELcOEQll/D0BBAOdkhoeONpoeMGJy64+7k
# j8iO8HV8BZF5DibWvBkO5D+I86Bw2jOnmz+M5yKq/EFMqPjpi+mwYZxULfR7uCDU
# ORw6xkCd0tbbBqwR8DIWJ2RMLq+IiXgZ6dCfta4r/yDFIErdsemsNHSYwKo9+Pj1
# PXbpbU5FsUG5SMFCCkQ7Kl1dvmOnjnS7Enoi1+Z0krZCID1CpcrrsnE1QKkb+ctD
# 1mINDaMZiypooNA67hyJqNdpH24pvqzN8Io55J8xggQNMIIECQIBATCBkzB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAeqaJHLVWT9hYwABAAAB6jAN
# BglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8G
# CSqGSIb3DQEJBDEiBCDgizeulOwxspGE8dpnhRX6bwNco2cQnhOM3zv5m6ohKTCB
# +gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EICmPodXjZDR4iwg0ltLANXBh5G1u
# KqKIvq8sjKekuGZ4MIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldh
# c2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIw
# MTACEzMAAAHqmiRy1Vk/YWMAAQAAAeowIgQgxLhl/KOB9b+5yF1sflQqRHWT5fc9
# MqZDK69Ub+YuTrUwDQYJKoZIhvcNAQELBQAEggIAcvNElS3dj4tNJ38cz+P5bM22
# AIXytNRKEAkc4DrErDJtiscCYb7wyaiBc41B3DfsB+GATLFONA14fTxMx8WInxnE
# hwn6LGIe2iNqUOEkgtsiqltZWhiqvHQ+AcJEtdTcEQUBNQEHn0AviCxIZrZrWqQY
# MHyFofEJFOvxAkyHfM1bE4RJ9FQG8Wv+4cA33j/qeEGqxKmc+5ztz5sKG1cmBtKr
# i0H3YGsQMribdrlMfdAixGGe0WNVFgDEKaKbyb8lC5daOhYlbSqBbLqMjeLXZm4x
# jsI9+QJXwgtkENBGFL9Vg6ikR+OL6DCTodmJz11PgMHLu6O9Z4O4MqkqnYCjN8M6
# nGhzi01XyRVXHhY4rrDM5t0YGtGMUT+DKBtl7BrhvQav2raj/2M5IIQrfQCOt2I6
# UJjmGgAqIeLgg/xNYDj2jSarf7lvbg1jb70TqoElirY0i8is5QgppG2feicOf3XT
# Kg1JiAsiGxiWjP1iOd84rTQBpGAt0v9l7sEDoKBcs01dbkk+C3Be6UpM/LKrxnke
# SVFM1dupZaDjvlydKDcklnd8B1MwCv/DhYb2bbXxd5eqGOinmBmQsCB/610yYBlw
# zr4vCZsjQymtZ9OnJYhn/l0yf1heP3MjnoAeesRr6YgoPkGCkx9eq7XHEGHwmKPo
# m40sqJea9d1NBwCeKPQ=
# SIG # End signature block
