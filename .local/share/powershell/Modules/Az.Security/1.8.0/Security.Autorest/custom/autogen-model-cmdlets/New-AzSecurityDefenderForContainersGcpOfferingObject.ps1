
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Create an in-memory object for DefenderForContainersGcpOffering.
.Description
Create an in-memory object for DefenderForContainersGcpOffering.

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Security.Models.DefenderForContainersGcpOffering
.Link
https://learn.microsoft.com/powershell/module/Az.Security/new-azsecuritydefenderforcontainersgcpofferingobject
#>
function New-AzSecurityDefenderForContainersGcpOfferingObject {
    [OutputType('Microsoft.Azure.PowerShell.Cmdlets.Security.Models.DefenderForContainersGcpOffering')]
    [CmdletBinding(PositionalBinding=$false)]
    Param(

        [Parameter(HelpMessage="Is audit logs data collection enabled.")]
        [bool]
        $AuditLogsAutoProvisioningFlag,
        [Parameter(HelpMessage="The data collection service account email address in GCP for this offering.")]
        [string]
        $DataPipelineNativeCloudConnectionServiceAccountEmailAddress,
        [Parameter(HelpMessage="The data collection GCP workload identity provider id for this offering.")]
        [string]
        $DataPipelineNativeCloudConnectionWorkloadIdentityProviderId,
        [Parameter(HelpMessage="Is Microsoft Defender for Cloud Kubernetes agent auto provisioning enabled.")]
        [bool]
        $DefenderAgentAutoProvisioningFlag,
        [Parameter(HelpMessage="Is Microsoft Defender container agentless discovery enabled.")]
        [bool]
        $MdcContainerAgentlessDiscoveryK8SEnabled,
        [Parameter(HelpMessage="The service account email address in GCP for this feature.")]
        [string]
        $MdcContainerAgentlessDiscoveryK8SServiceAccountEmailAddress,
        [Parameter(HelpMessage="The workload identity provider id in GCP for this feature.")]
        [string]
        $MdcContainerAgentlessDiscoveryK8SWorkloadIdentityProviderId,
        [Parameter(HelpMessage="Is Microsoft Defender container image assessment enabled.")]
        [bool]
        $MdcContainerImageAssessmentEnabled,
        [Parameter(HelpMessage="The service account email address in GCP for this feature.")]
        [string]
        $MdcContainerImageAssessmentServiceAccountEmailAddress,
        [Parameter(HelpMessage="The workload identity provider id in GCP for this feature.")]
        [string]
        $MdcContainerImageAssessmentWorkloadIdentityProviderId,
        [Parameter(HelpMessage="The service account email address in GCP for this offering.")]
        [string]
        $NativeCloudConnectionServiceAccountEmailAddress,
        [Parameter(HelpMessage="The GCP workload identity provider id for this offering.")]
        [string]
        $NativeCloudConnectionWorkloadIdentityProviderId,
        [Parameter(HelpMessage="Is Policy Kubernetes agent auto provisioning enabled.")]
        [bool]
        $PolicyAgentAutoProvisioningFlag
    )

    process {
        $Object = [Microsoft.Azure.PowerShell.Cmdlets.Security.Models.DefenderForContainersGcpOffering]::New()

        if ($PSBoundParameters.ContainsKey('AuditLogsAutoProvisioningFlag')) {
            $Object.AuditLogsAutoProvisioningFlag = $AuditLogsAutoProvisioningFlag
        }
        if ($PSBoundParameters.ContainsKey('DataPipelineNativeCloudConnectionServiceAccountEmailAddress')) {
            $Object.DataPipelineNativeCloudConnectionServiceAccountEmailAddress = $DataPipelineNativeCloudConnectionServiceAccountEmailAddress
        }
        if ($PSBoundParameters.ContainsKey('DataPipelineNativeCloudConnectionWorkloadIdentityProviderId')) {
            $Object.DataPipelineNativeCloudConnectionWorkloadIdentityProviderId = $DataPipelineNativeCloudConnectionWorkloadIdentityProviderId
        }
        if ($PSBoundParameters.ContainsKey('DefenderAgentAutoProvisioningFlag')) {
            $Object.DefenderAgentAutoProvisioningFlag = $DefenderAgentAutoProvisioningFlag
        }
        if ($PSBoundParameters.ContainsKey('MdcContainerAgentlessDiscoveryK8SEnabled')) {
            $Object.MdcContainerAgentlessDiscoveryK8SEnabled = $MdcContainerAgentlessDiscoveryK8SEnabled
        }
        if ($PSBoundParameters.ContainsKey('MdcContainerAgentlessDiscoveryK8SServiceAccountEmailAddress')) {
            $Object.MdcContainerAgentlessDiscoveryK8SServiceAccountEmailAddress = $MdcContainerAgentlessDiscoveryK8SServiceAccountEmailAddress
        }
        if ($PSBoundParameters.ContainsKey('MdcContainerAgentlessDiscoveryK8SWorkloadIdentityProviderId')) {
            $Object.MdcContainerAgentlessDiscoveryK8SWorkloadIdentityProviderId = $MdcContainerAgentlessDiscoveryK8SWorkloadIdentityProviderId
        }
        if ($PSBoundParameters.ContainsKey('MdcContainerImageAssessmentEnabled')) {
            $Object.MdcContainerImageAssessmentEnabled = $MdcContainerImageAssessmentEnabled
        }
        if ($PSBoundParameters.ContainsKey('MdcContainerImageAssessmentServiceAccountEmailAddress')) {
            $Object.MdcContainerImageAssessmentServiceAccountEmailAddress = $MdcContainerImageAssessmentServiceAccountEmailAddress
        }
        if ($PSBoundParameters.ContainsKey('MdcContainerImageAssessmentWorkloadIdentityProviderId')) {
            $Object.MdcContainerImageAssessmentWorkloadIdentityProviderId = $MdcContainerImageAssessmentWorkloadIdentityProviderId
        }
        if ($PSBoundParameters.ContainsKey('NativeCloudConnectionServiceAccountEmailAddress')) {
            $Object.NativeCloudConnectionServiceAccountEmailAddress = $NativeCloudConnectionServiceAccountEmailAddress
        }
        if ($PSBoundParameters.ContainsKey('NativeCloudConnectionWorkloadIdentityProviderId')) {
            $Object.NativeCloudConnectionWorkloadIdentityProviderId = $NativeCloudConnectionWorkloadIdentityProviderId
        }
        if ($PSBoundParameters.ContainsKey('PolicyAgentAutoProvisioningFlag')) {
            $Object.PolicyAgentAutoProvisioningFlag = $PolicyAgentAutoProvisioningFlag
        }
        return $Object
    }
}


# SIG # Begin signature block
# MIIoOQYJKoZIhvcNAQcCoIIoKjCCKCYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCMVmyi3BpFlOKM
# 0w890uhYoUTQ2ft/U0+c13ili5tvWKCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGgowghoGAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAAQDvdWVXQ87GK0AAAAA
# BAMwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEID1m
# kyC6eFl75mLcBypgPFqJal0AvGMIgLVWMSmwV+omMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAU2HBiMGmtpNE64Sqy7cVtfRz/TFzSVpxgYvr
# CKgh6/LsZrTQTGwIFGBx5wMmyNzpOvkq1Li+77eFCvNL+GwoeN5yk+omwl0HSeYV
# 0PsGaSKByjfNTs0f1cp8M3WN6IjDdgB4ktEytlV08A98LzLxITXzkemeQFRPs1+h
# R610R3wbnrAyhUed7cYsH5DKb+/S5bDXY8q7jEoNcYKY9kITOFmlXCyo56ob42s/
# MAewolKdg5r4qrME6+FFQeOorAmo6TBRJl+xCeSIlw0bEBBZ/eAxPnwvoesWkWvg
# XYeWTUqxILCJlYrvujv9G8LuDdfHJ63Y49Hbb+2XaHzQDbwrXqGCF5QwgheQBgor
# BgEEAYI3AwMBMYIXgDCCF3wGCSqGSIb3DQEHAqCCF20wghdpAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCBuesel+Uxa+AuxUsYK2D3EhTHuofaQDfd/
# /jY7Ha2N/QIGZ1sNHJL2GBMyMDI1MDEwOTA2Mzc0OS4xNDNaMASAAgH0oIHRpIHO
# MIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQL
# ExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxk
# IFRTUyBFU046MzMwMy0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFNlcnZpY2WgghHqMIIHIDCCBQigAwIBAgITMwAAAebZQp7qAPh94QAB
# AAAB5jANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDAeFw0yMzEyMDYxODQ1MTVaFw0yNTAzMDUxODQ1MTVaMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046MzMwMy0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC9vph84tgluEzm/wpNKlAj
# cElGzflvKADZ1D+2d/ieYYEtF2HKMrKGFDOLpLWWG5DEyiKblYKrE2nt540OGu35
# Zx0gXJBE0zWanZEAjCjt4eGBi+uakZsk70zHTQHHyfP+B3m2BSSNFPhgsVIPp6vo
# /9t6OeNezIwX5E5+VwEG37nZgEexQF2fQZYbxQ1AauqDvRdXsSpK1dh1UBt9EaMs
# zuucaR5nMwQN6sDjG99FzdK9Atzbn4SmlsoLUtRAh/768sKd0Y1hMmKVHwIX8/4J
# uURUBRZ0JWu0NYQBp8khku18Q8CAQ500tFB7VH3pD8zoA4lcA7JkxTGoPKrufm+l
# RZAA4iMgbcLZ2P/xSdnKFxU8vL31RoNlZJiGL5MqTXvvyBLz+MRP4En9Nye1N8x/
# lJD1stdNo5wJG+mgXsE/zfzg2GaVqQczFHg0Nl8bpIqnNFUReQRq3C1jVYMCSceg
# NzHeYtw5OmZ/7eVnRmjXlCsLvdsxOzc1YVn6nZLkQD5y31HYrB9iIHuswhaMv2hJ
# NNjVndkpWy934PIZuWTMk360kjXPFwl2Wv1Tzm9tOrCq8+l408KIL6J+efoGNkR8
# YB3M+u1tYeVDO/TcObGHxaGFB6QZxAUpnfB5N/MmBNxMOqzG1N8QiwW8gtjjMJiF
# Bf6iYYrCjtRwF7IPdQLFtQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFOUEMXntN54+
# 11ZM+Qu7Q5rg3Fc9MB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQBhbuogTapRsuwS
# kaFMQ6dyu8ZCYUpWQ8iIrbi40tU2hK6pHgu0hj0z/9zFRRx5DfhukjvbjA/dS5VY
# fxz1EIbPlt897MJ2sBGO2YLYwYelfJpDwbB0XS9Zkrqpzq6X/lmDQDn3G5vcYpYQ
# CJ55LLvyFlJ195AVo4Wy8UX5p7g9W3MgNHQMpM+EV64+cszj4Ho5aQmeKGtKy7w7
# 2eRY/vWDuptrvzruFNmKCIt12UcA5BOsXp1Ptkjx2yRsCj77DSml0zVYjqW/ISWk
# rGjyeVJ+khzctxaLkklVwCxigokD6fkWby0hCEKTOTPMzhugPIAcxcHsR2sx01YR
# a9pH2zvddsuBEfSFG6Cj0QSvEZ/M9mJ+h4miaQSR7AEbVGDbyRKkYn80S+3AmRlh
# 3ZOe+BFqJ57OXdeIDSHbvHzJ7oTqG896l3eUhPsZg69fNgxTxlvRNmRE/+61Yj7Z
# 1uB0XYQP60rsMLdTlVYEyZUl5MLTL5LvqFozZlS2Xoji4BEP6ddVTzmHJ4odOZMW
# TTeQ0IwnWG98vWv/roPegCr1G61FVrdXLE3AXIft4ZN4ZkDTnoAhPw7DZNPRlSW4
# TbVj/Lw0XvnLYNwMUA9ouY/wx9teTaJ8vTkbgYyaOYKFz6rNRXZ4af6e3IXwMCff
# CaspKUXC72YMu5W8L/zyTxsNUEgBbTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
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
# ELQdVTNYs6FwZvKhggNNMIICNQIBATCB+aGB0aSBzjCByzELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoT
# FU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJp
# Y2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjMzMDMtMDVF
# MC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMK
# AQEwBwYFKw4DAhoDFQDiWNBeFJ9jvaErN64D1G86eL0mu6CBgzCBgKR+MHwxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6ynLSzAi
# GA8yMDI1MDEwOTA0MTI1OVoYDzIwMjUwMTEwMDQxMjU5WjB0MDoGCisGAQQBhFkK
# BAExLDAqMAoCBQDrKctLAgEAMAcCAQACAg4uMAcCAQACAhMGMAoCBQDrKxzLAgEA
# MDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAI
# AgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAA5Ilmpo0pr4jvWKmHyIkV9T4mqN
# TxPS+wh7B7nmrYo9WXQ8uP3Tz0R6z8QIdg5BpiZrNzbgamGwem7AanWg1wc8esI2
# Gs1x3X+l+VlxnXau/rqpr3CK6a2lR1NkGdyt3EcBhRzRjKS6QrncsYGQrN2YXUUZ
# hK9WQwptz5FW0tI55pdi3pPGNbSxir3CCEnzU5IsooOsou90mwzN7zjuhDZ7HzNK
# 7pMChzHbYqv9/YoEaO0CIx7PTHixzGx8F4I0RiN0y8UiI1nHJkms7KoVuw+RAOED
# LprFBfDrT2mRBXMQzK71w55Zp6xSsnbgXnozy2Ff9fO7rmGW2yEgjhGTLOExggQN
# MIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAebZ
# Qp7qAPh94QABAAAB5jANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0G
# CyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCBtCkGIIS/iv5y/T3HXinh1r1A2
# dn/h8BIxp5jr1m2z+DCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIM+7o4ao
# HrMJaG8gnLO1q16hIYcRnoy6FnOCbnSD0sZZMIGYMIGApH4wfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAHm2UKe6gD4feEAAQAAAeYwIgQg/Jfqzlgo
# UAkbgEEZvk960ps+/Ta+1aEAZisksM/UAagwDQYJKoZIhvcNAQELBQAEggIATCQS
# 7YFDrAXlXcmW9eSvqmHUaibPCEiTnQYnUoekc8ReTmnAS+iF00FbY0WfuJ/NopkE
# VR8EMw/24+6tnw8Igt4cIZGEjYe5GBSEQbA/HgHcWGzaCbUcHB8a9MVpYfynnJPc
# WdDZZTrqxXQXWNZyAX4BeJtGzEGT1OeWbjty4erxjyUeP9IViSwC0YIV5qsCW57d
# jmi2eO2oS3EfP7ZQBHI6Cve+5SeDStFZ/aMr+UZ3H4ulVIL8HS9qH28onKBs2y7v
# 6YAgiHLcl/5JztcJBmDEU62alhSRLC9PkImMsyvWMNZYEuHhaYRFp4g8tmDKbS+s
# 2l/nmVWqo5pIW25JffjI/o9eLEFzOcx+vYhZys06rauqc9fv2wXOBfy5ReQxYsHs
# TrrNi8EbN1jRuph4aU+LZX94bvQktayrkq3BxbWcTqDMQbV5FD0rcH1neyIwAwZT
# zo5YnNO72cjTPmUyhbtYPywVrhs+6PM7hBeUgqIgYXCMWUip+iy4QauctMDhznrW
# CuHmiNIHdlo+6CFLuxMWq2BZjf9QRF14YeDIsNgPHI7RtFRIC3fV3d2u62Any5yK
# GY+1DqcgteB+vLLLFIG/wC79Z4YD/pqwwXD0Lwcbggi2Xs5LjiMyMW36q0eNVvxZ
# 7jJCCfAK4ym5DX07RIx0YpB09H8aZhm+/r9aiFE=
# SIG # End signature block
