
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Get All discovered servers in a migrate project.
.Description
Get Azure migrate server commandlet fetches all servers in a migrate project.
.Link
https://learn.microsoft.com/powershell/module/az.migrate/get-azmigratediscoveredserver
#>

function Get-AzMigrateDiscoveredServer {
    [OutputType(
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202001.IVMwareMachine],
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api202001.IHyperVMachine])]
    [CmdletBinding(DefaultParameterSetName = 'List', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param (
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the migrate project name.
        ${ProjectName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the resource group name.
        ${ResourceGroupName},

        [Parameter(ParameterSetName = 'Get', Mandatory)]
        [Parameter(ParameterSetName = 'GetInSite', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the source machine name. This is an internal Name. For users, use display name.
        ${Name},

        [Parameter(ParameterSetName = 'List')]
        [Parameter(ParameterSetName = 'ListInSite')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the source machine display name.
        ${DisplayName},

        [Parameter(ParameterSetName = 'GetInSite', Mandatory)]
        [Parameter(ParameterSetName = 'ListInSite', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the appliance name. This internally maps to a site.
        ${ApplianceName},

        [Parameter()]
        [ValidateSet("VMware", "HyperV")]
        [ArgumentCompleter( { "VMware", "HyperV" })]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [System.String]
        # Specifies the source machine type. Currently, only HyperV and VMware are supported.
        ${SourceMachineType} = "VMware",

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Migrate.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String[]]
        # Specifies the subscription id.
        ${SubscriptionId}
    )
    
    process {
        $parameterSet = $PSCmdlet.ParameterSetName
        $hasApplianceName = $PSBoundParameters.ContainsKey("ApplianceName")
        
        $discoverySolutionName = "Servers-Discovery-ServerDiscovery"
        $discoverySolution = Az.Migrate\Get-AzMigrateSolution -SubscriptionId $SubscriptionId -ResourceGroupName $ResourceGroupName -MigrateProjectName $ProjectName -Name $discoverySolutionName
        if ($discoverySolution.Name -ne $discoverySolutionName)
        {
            throw "Server Discovery Solution not found."
        }

        $appMap = @{}

        if ($null -ne $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"])
        {
            $appMapV2 = $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"] | ConvertFrom-Json
            # Fetch all appliance from V2 map first. Then these can be updated if found again in V3 map.
            foreach ($item in $appMapV2)
            {
                $appMap[$item.ApplianceName] = $item.SiteId
            }
        }
        
        if ($null -ne $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"])
        {
            $appMapV3 = $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"] | ConvertFrom-Json
            foreach ($item in $appMapV3)
            {
                $t = $item.psobject.properties
                $appMap[$t.Name] = $t.Value.SiteId
            }    
        }

        if ($null -eq $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV2"] -And
            $null -eq $discoverySolution.DetailExtendedDetail["applianceNameToSiteIdMapV3"] )
        {
            throw "Server Discovery Solution missing Appliance Details. Invalid Solution."           
        }

        # Regex to match site name.
        if ($SourceMachineType -eq "VMware")
        {
            $siteRegex = "(?<=/Microsoft.OffAzure/VMwareSites/).*$"
        }
        else {
            $siteRegex = "(?<=/Microsoft.OffAzure/HyperVSites/).*$"
        }

        if ($parameterSet -match 'Get')
        {
            # Get or GetInSite
            foreach ($kvp in $appMap.GetEnumerator())
            {
                if (($kvp.Value -match $siteRegex) -and
                    (-not (($parameterSet -eq 'GetInSite') -and ($kvp.Key -ne $ApplianceName))))
                {
                    $siteNameTmp = $Matches[0]
                    if ($SourceMachineType -eq "VMware")
                    {
                        $machine = Az.Migrate.Internal\Get-AzMigrateMachine `
                            -Name $Name `
                            -ResourceGroupName $ResourceGroupName `
                            -SiteName $siteNameTmp `
                            -SubscriptionId $SubscriptionId `
                            -ErrorVariable notPresent `
                            -ErrorAction SilentlyContinue
                    }
                    else {
                        # HyperV
                        $machine = Az.Migrate.Internal\Get-AzMigrateHyperVMachine `
                            -MachineName $Name `
                            -ResourceGroupName $ResourceGroupName `
                            -SiteName $siteNameTmp `
                            -SubscriptionId $SubscriptionId `
                            -ErrorVariable notPresent `
                            -ErrorAction SilentlyContinue
                    }

                    # Remove server marked as Deleted.
                    if ($null -ne $machine -and $machine.IsDeleted)
                    {
                        $machine = $null
                    }
    
                    if ($null -ne $machine)
                    {
                        return $machine
                    }
                }
            }

            $errorMsg = "No machine with machine Name '$Name' of Type '$SourceMachineType' found in Project '$ProjectName'"
            if ($hasApplianceName)
            {
                $errorMsg += " with Appliance '$ApplianceName'"
            }

            throw $errorMsg
        }
        else {
            # List or ListInSite
            $allMachines = [System.Collections.ArrayList]::new()
            foreach ($kvp in $appMap.GetEnumerator())
            {
                if (($kvp.Value -match $siteRegex) -and
                    (-not (($parameterSet -eq 'ListInSite') -and ($kvp.Key -ne $ApplianceName))))
                {
                    $siteNameTmp = $Matches[0]
                    if ($SourceMachineType -eq "VMware")
                    {
                        $machines = Az.Migrate.Internal\Get-AzMigrateMachine `
                            -ResourceGroupName $ResourceGroupName `
                            -SiteName $siteNameTmp `
                            -SubscriptionId $SubscriptionId
                    }
                    else {
                        # HyperV
                        $machines = Az.Migrate.Internal\Get-AzMigrateHyperVMachine `
                            -ResourceGroupName $ResourceGroupName `
                            -SiteName $siteNameTmp `
                            -SubscriptionId $SubscriptionId
                    }

                    if ($null -ne $machines)
                    {
                        $allMachines.AddRange($machines)
                    }
                }
            }

            # Remove servers marked as Deleted.
            $allMachines = $allMachines | Where-Object { !$_.IsDeleted }

            if ($allMachines.Count -gt 0 -and $DisplayName)
            {
                $allMachines = $allMachines | Where-Object { $_.DisplayName -match $DisplayName }
            }

            if ($allMachines.Count -eq 0)
            {
                $errorMsg = "No machine of Type '$SourceMachineType' found in Project '$ProjectName'"
                if ($hasApplianceName)
                {
                    $errorMsg += " with Appliance '$ApplianceName'"
                }

                if ($DisplayName)
                {
                    $errorMsg += " with matching machine DisplayName '$DisplayName'"
                }

                throw $errorMsg
            }
            
            return $allMachines
        }
    }
}
# SIG # Begin signature block
# MIIoUgYJKoZIhvcNAQcCoIIoQzCCKD8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCEkmwi8QjfYOWf
# buXBrMIAX7OUYIan9Gqz9zQ3Bf1IQ6CCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIC0t
# jZF9MjLOsaaFlAIL0TG/TpYn/slTX8Jlw7mRagXJMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAIqTyzwU9l0A5Se1SGOSGWSBYvzTa1Kzwl+zh
# fcMayGF0XknsnVUXh5WB7C3giR4wqdQmF1BFkqPIF0y+fhPfEiSwmI8nbKAmzulE
# zJSk8iRMGxUc8KKmtLXncyI1UwL3qpknkLWfgUpK8K41PG3dgbiljw4ZbIp9qSKx
# bbmH7f11UosUyz9pmUqnCrpgnfEBZqVcnBZf1stfBMSxiAFNlC8MA0nXEVhG4JMO
# EM2RiXE9lSp/Cd3LS7jP3jjIDpfcwW4gwBASdYxRzkXv7aRs9YHQPt+3YYuTsfaC
# 2wKz0eKM+61Im63ZLDdHujxgSGAi2+yhA4DdAaBEhGWnQ2LSsaGCF60wghepBgor
# BgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCCF4YwgheCAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCAm2nWH/npsEdxA+hWmqG+wTE7zCicwfPGa
# T4uDkuYIVQIGZ7YtlOlsGBMyMDI1MDIyNTA3MDMzNC4xNDVaMASAAgH0oIHZpIHW
# MIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjo1NTFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggcoMIIFEKADAgECAhMzAAACAdFF
# WZgQzEJPAAEAAAIBMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMB4XDTI0MDcyNTE4MzEyMloXDTI1MTAyMjE4MzEyMlowgdMxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jv
# c29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVs
# ZCBUU1MgRVNOOjU1MUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# tWrf+HzDu7sk50y5YHheCIJG0uxRSFFcHNek+Td9ZmyJj20EEjaU8JDJu5pWc4pP
# AsBI38NEAJ1b+KBnlStqU8uvXF4qnEShDdi8nPsZZQsTZDKWAgUM2iZTOiWIuZcF
# s5ZC8/+GlrVLM5h1Y9nfMh5B4DnUQOXMremAT9MkvUhg3uaYgmqLlmYyODmba4lX
# ZBu104SLAFsXOfl/TLhpToT46y7lI9sbI9uq3/Aerh3aPi2knHvEEazilXeooXNL
# Cwdu+Is6o8kQLouUn3KwUQm0b7aUtsv1X/OgPmsOJi6yN3LYWyHISvrNuIrJ4iYN
# gHdBBumQYK8LjZmQaTKFacxhmXJ0q2gzaIfxF2yIwM+V9sQqkHkg/Q+iSDNpMr6m
# r/OwknOEIjI0g6ZMOymivpChzDNoPz9hkK3gVHZKW7NV8+UBXN4G0aBX69fKUbxB
# BLyk2cC+PhOoUjkl6UC8/c0huqj5xX8m+YVIk81e7t6I+V/E4yXReeZgr0FhYqNp
# vTjGcaO2WrkP5XmsYS7IvMPIf4DCyIJUZaqoBMToAJJHGRe+DPqCHg6bmGPm97Mr
# OWv16/Co6S9cQDkXp9vMSSRQWXy4KtJhZfmuDz2vr1jw4NeixwuIDGw1mtV/TdSI
# +vpLJfUiLl/b9w/tJB92BALQT8e1YH8NphdOo1xCwkcCAwEAAaOCAUkwggFFMB0G
# A1UdDgQWBBSwcq9blqLoPPiVrym9mFmFWbyyUjAfBgNVHSMEGDAWgBSfpxVdAF5i
# XYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENB
# JTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRp
# bWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsF
# AAOCAgEAOjQAyz0cVztTFGqXX5JLRxFK/O/oMe55uDqEC8Vd1gbcM28KBUPgvUIP
# Xm/vdDN2IVBkWHmwCp4AIcy4dZtkuUmd0fnu6aT9Mvo1ndsLp2YJcMoFLEt3Ttri
# LaO+i4Grv0ZULtWXUPAW/Mn5Scjgn0xZduGPBD/Xs3J7+get9+8ZvBipsg/N7poi
# mYOVsHxLcem7V5XdMNsytTm/uComhM/wgR5KlDYTVNAXBxcSKMeJaiD3V1+HhNkV
# liMl5VOP+nw5xWF55u9h6eF2G7eBPqT+qSFQ+rQCQdIrN0yG1QN9PJroguK+FJQJ
# dQzdfD3RWVsciBygbYaZlT1cGJI1IyQ74DQ0UBdTpfeGsyrEQ9PI8QyqVLqb2q7L
# tI6DJMNphYu+jr//0spr1UVvyDPtuRnbGQRNi1COwJcj9OYmlkFgKNeCfbDT7U3u
# EOvWomekX60Y/m5utRcUPVeAPdhkB+DxDaev3J1ywDNdyu911nAVPgRkyKgMK3US
# LG37EdlatDk8FyuCrx4tiHyqHO3wE6xPw32Q8e/vmuQPoBZuX3qUeoFIsyZEenHq
# 2ScMunhcqW32SUVAi5oZ4Z3nf7dAgNau21NEPwgW+2wkrNqDg7Hp8yHyoOKbgEBu
# 6REQbvSfZ5Kh4PV+S2gxf2uq6GoYDnlqABOMYwz309ISi0bPMh8wggdxMIIFWaAD
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
# Hm5TaGllbGQgVFNTIEVTTjo1NTFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUA1+26cR/yH100
# DiNFGWhuAv2rYBqggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDANBgkqhkiG9w0BAQsFAAIFAOtnQyowIhgPMjAyNTAyMjQxOTEyNDJaGA8yMDI1
# MDIyNTE5MTI0MlowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA62dDKgIBADAHAgEA
# AgIiQDAHAgEAAgITLTAKAgUA62iUqgIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgor
# BgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUA
# A4IBAQCVnRAhkoqT8RBBGWudZFKRJzypR/sjt8xHF0U5rFxq2bIZoJJcS5mr7SZi
# OTbspJaXHbjrPyw2l9XDA1Rg+vaP/v3NBKEwtft6AN1uMZSy4Fnn0Rw6Kqfaa7KU
# niRjtVMSJXaCzQlij43dMUrKSjfqde4mH8D3uVTWw2ZM9mnSvkoax2U4YYrMN5qN
# cLNZItlUYxiUdGBEQ88RelCg4zjUv12aSL1In0OhLafqj+ZXQ5uMHYRSh+7xud0y
# rHB0bBLVFv5Z/aV6dvEkkZMjwzoHGadeEFxu/HeU7U2UwGz0lp2J7Tt2davHCqg8
# z5r9Y+S/bbol/jrvwOrH9gP611HkMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAIB0UVZmBDMQk8AAQAAAgEwDQYJYIZIAWUD
# BAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0B
# CQQxIgQgK8PdcDVnppwBir1nZDgglPckHYkdY+yuMoXIodjEWhAwgfoGCyqGSIb3
# DQEJEAIvMYHqMIHnMIHkMIG9BCBYa7I6TJQRcmx0HaSTWZdJgowdrl9+Zrr0pIdq
# Htc4IzCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAC
# AdFFWZgQzEJPAAEAAAIBMCIEIB92IWC6w/u1dcKG6l4FuGyQLuonCBNq9cbul2T2
# 7+l2MA0GCSqGSIb3DQEBCwUABIICAHPXl9GZF97XJfRSSBWu1TVqOH5eeSUbbhQO
# oPJg9bbEidQJw5yljDWPAYGcTaQ0VL81Fg1PCejCUxHBggNfcWdIDJ+ynseuA1tr
# YcsOJqQmtZqL5ixbqxwtP3QDElKjpaEuDAAyMB1CsVBbRO6BXo0q1Ji/MCZBQwlF
# J89fQey3LdrvUpYhLjKgbgOxMZE/x3/Gfwi0+K92FL55GaR/L2fZZx03y9M/w2Ga
# j8UuFRYoNUu62Jpiet8KPHRlA6ajKy+xvjveopKTdVZ9QygVd51857yXUaddw7Q+
# gd3F6CgiwlcTjt0GfNbiUWRZwCgyqEwKmzDYKIQpzBhSjHcmTg7Qvrs4u8GXF+Ca
# Nm1RTiGtPJBbWlfB7b2EgBkoHgFmfKZ2313Hg6PEugBRv9X0UH59qNm33JQHKm0M
# tnEQNnP2FPTVQ+iyUW3yoadrHn/VCOF9RyRSPru5KBsa1i+tbQY2FOoMhTs70x4g
# zIXzCLi6RRLjOqn5jRtNOCoh5D5FntQ06E8E5grRqLC1ZhdW4dqn3KA8LMJKyTR2
# JU0mAowKprf+o93Q1++Jlh9rXkaVljp0i8qhce8f2hmFfrBn7tUNXYxYNYQ9jipe
# CArh12v3grtQ9LUAhwFl0tvxX++XcrXH/n8eX1OpB2FimdZyhORmLcWszG7jZdyz
# +cHuivLr
# SIG # End signature block
