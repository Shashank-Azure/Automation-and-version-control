
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
Gets a Dev Box.
.Description
Gets a Dev Box.
.Example
Get-AzDevCenterUserDevBox -Endpoint "https://8a40af38-3b4c-4672-a6a4-5e964b1870ed-contosodevcenter.centralus.devcenter.azure.com/"
.Example
Get-AzDevCenterUserDevBox -Endpoint "https://8a40af38-3b4c-4672-a6a4-5e964b1870ed-contosodevcenter.centralus.devcenter.azure.com/" -UserId 786a823c-8037-48ab-89b8-8599901e67d0
.Example
Get-AzDevCenterUserDevBox -Endpoint "https://8a40af38-3b4c-4672-a6a4-5e964b1870ed-contosodevcenter.centralus.devcenter.azure.com/" -ProjectName DevProject -UserId "me"
.Example
Get-AzDevCenterUserDevBox -DevCenterName Contoso
.Example
Get-AzDevCenterUserDevBox -DevCenterName Contoso -UserId "me"
.Example
Get-AzDevCenterUserDevBox -DevCenterName Contoso -ProjectName DevProject -UserId 786a823c-8037-48ab-89b8-8599901e67d0
.Example
Get-AzDevCenterUserDevBox -Endpoint "https://8a40af38-3b4c-4672-a6a4-5e964b1870ed-contosodevcenter.centralus.devcenter.azure.com/" -ProjectName DevProject -UserId 786a823c-8037-48ab-89b8-8599901e67d0 -Name myDevBox
.Example
Get-AzDevCenterUserDevBox -DevCenterName Contoso -ProjectName DevProject -UserId "me" -Name myDevBox
.Example
$devBoxInput = @{"DevBoxName" = "myDevBox"; "UserId" = "me"; "ProjectName" = "DevProject" }
Get-AzDevCenterUserDevBox -Endpoint "https://8a40af38-3b4c-4672-a6a4-5e964b1870ed-contosodevcenter.centralus.devcenter.azure.com/" -InputObject $devBoxInput
.Example
$devBoxInput = @{"DevBoxName" = "myDevBox"; "UserId" = "786a823c-8037-48ab-89b8-8599901e67d0"; "ProjectName" = "DevProject" }
Get-AzDevCenterUserDevBox -DevCenterName Contoso -InputObject $devBoxInput 

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Models.IDevCenterdataIdentity
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Models.Api20240501Preview.IDevBox
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IDevCenterdataIdentity>: Identity Parameter
  [ActionName <String>]: The name of the action.
  [CatalogName <String>]: Name of the catalog.
  [CustomizationGroupName <String>]: Name of the customization group.
  [CustomizationTaskId <String>]: A customization task ID.
  [DefinitionName <String>]: Name of the environment definition.
  [DevBoxName <String>]: Display name for the Dev Box.
  [EnvironmentName <String>]: Environment name.
  [EnvironmentTypeName <String>]: Name of the environment type.
  [Id <String>]: Resource identity path
  [OperationId <String>]: Unique identifier for the Dev Box operation.
  [PoolName <String>]: Pool name.
  [ProjectName <String>]: Name of the project.
  [ScheduleName <String>]: Display name for the Schedule.
  [TaskName <String>]: Full name of the task: {catalogName}/{taskName}.
  [UserId <String>]: The AAD object id of the user. If value is 'me', the identity is taken from the authentication context.
.Link
https://learn.microsoft.com/powershell/module/az.devcenter/get-azdevcenteruserdevbox
#>
function Get-AzDevCenterUserDevBox {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Models.Api20240501Preview.IDevBox])]
    [CmdletBinding(DefaultParameterSetName='List', PositionalBinding=$false)]
    param(
        [Parameter(ParameterSetName='Get', Mandatory)]
        [Parameter(ParameterSetName='GetViaIdentity', Mandatory)]
        [Parameter(ParameterSetName='List', Mandatory)]
        [Parameter(ParameterSetName='List1', Mandatory)]
        [Parameter(ParameterSetName='List2', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Uri')]
        [System.String]
        # The DevCenter-specific URI to operate on.
        ${Endpoint},

        [Parameter(ParameterSetName='GetViaIdentityByDevCenter', Mandatory)]
        [Parameter(ParameterSetName='ListByDevCenter', Mandatory)]
        [Parameter(ParameterSetName='List2ByDevCenter', Mandatory)]
        [Parameter(ParameterSetName='List1ByDevCenter', Mandatory)]
        [Parameter(ParameterSetName='GetByDevCenter', Mandatory)]
        [Alias('DevCenter')]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Uri')]
        [System.String]
        # The DevCenter upon which to execute operations.
        ${DevCenterName},
    
        [Parameter(ParameterSetName='Get', Mandatory)]
        [Parameter(ParameterSetName='GetByDevCenter', Mandatory)]
        [Alias('DevBoxName')]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Path')]
        [System.String]
        # Display name for the Dev Box.
        ${Name},
    
        [Parameter(ParameterSetName='Get', Mandatory)]
        [Parameter(ParameterSetName='List2', Mandatory)]
        [Parameter(ParameterSetName='List2ByDevCenter', Mandatory)]
        [Parameter(ParameterSetName='GetByDevCenter', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Path')]
        [System.String]
        # Name of the project.
        ${ProjectName},
    
        [Parameter(ParameterSetName='Get', Mandatory)]
        [Parameter(ParameterSetName='List1', Mandatory)]
        [Parameter(ParameterSetName='List2', Mandatory)]
        [Parameter(ParameterSetName='List2ByDevCenter', Mandatory)]
        [Parameter(ParameterSetName='List1ByDevCenter', Mandatory)]
        [Parameter(ParameterSetName='GetByDevCenter', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Path')]
        [System.String]
        # The AAD object id of the user.
        # If value is 'me', the identity is taken from the authentication context.
        ${UserId},
    
        [Parameter(ParameterSetName='GetViaIdentity', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName='GetViaIdentityByDevCenter', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Models.IDevCenterdataIdentity]
        # Identity Parameter
        # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
        ${InputObject},
    
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The DefaultProfile parameter is not functional.
        # Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.
        ${DefaultProfile},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.DevCenterdata.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )


    process {
        if (-not $PSBoundParameters.ContainsKey('Endpoint')) {
            $Endpoint = GetEndpointFromResourceGraph -DevCenterName $DevCenterName -Project $ProjectName
            $null = $PSBoundParameters.Add("Endpoint", $Endpoint)
            $null = $PSBoundParameters.Remove("DevCenterName")
      
        }
        else {
            $Endpoint = ValidateAndProcessEndpoint -Endpoint $Endpoint
            $PSBoundParameters["Endpoint"] = $Endpoint
        }
        Az.DevCenterdata.internal\Get-AzDevCenterUserDevBox @PSBoundParameters
    }
}

# SIG # Begin signature block
# MIIoUgYJKoZIhvcNAQcCoIIoQzCCKD8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDyK6sK7LI0oCMb
# bnfkiNDZ6DRreLD3K3bQGWh9ZDijQqCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEII2p
# JJvVnNq0jBApMNij2sDNT2jBD0XF+qDJ+jOZXr4eMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAa+aB8Mjj9DXyCSUs/qluQgN+qAwO7hmbL8/b
# 0zql/krAyjuDlBCbh8X5DYDKOSgcvnM2mHUvboOFdMf5DnaadAJTgohVdrSu3jlt
# eoDfGWUK2weO3LtEcKMRTuLGN9p6MJDX2FvzyIasuXPsibLWmmN1cAr3kKyYNm6z
# 0VbfwwMz4xmT9UvLMwEdgu/c4M/OlFMUeZdw6z4ot97zOMgNVCjWQg1qqIdmBrBN
# i32+vcrLjyt2gP/FuEMX7+prv3StGAfbMPv7V+3sTCESX4pUVnGFXPMuKY/YlWXk
# COusgwaxWoTY7EbeqK7wGicHmlEykT2FZ1gHYcTSWXIuCtse+6GCF60wghepBgor
# BgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCCF4YwgheCAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCA6Oisl9NfMpU/4Ypa8yseP6kAbaK+VyDcN
# ypIC4DyFYQIGZ2K0KsDPGBMyMDI1MDEwOTA2Mzc0OC45ODVaMASAAgH0oIHZpIHW
# MIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjozNjA1LTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggcoMIIFEKADAgECAhMzAAAB91gg
# dQTK+8L0AAEAAAH3MA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMB4XDTI0MDcyNTE4MzEwNloXDTI1MTAyMjE4MzEwNlowgdMxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jv
# c29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVs
# ZCBUU1MgRVNOOjM2MDUtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# 0OdHTBNom6/uXKaEKP9rPITkT6QxF11tjzB0Nk1byDpPrFTHha3hxwSdTcr8Y0a3
# k6EQlwqy6ROz42e0R5eDW+dCoQapipDIFUOYp3oNuqwX/xepATEkY17MyXFx6rQW
# 2NcWUJW3Qo2AuJ0HOtblSpItQZPGmHnGqkt/DB45Fwxk6VoSvxNcQKhKETkuzrt8
# U6DRccQm1FdhmPKgDzgcfDPM5o+GnzbiMu6y069A4EHmLMmkecSkVvBmcZ8VnzFH
# TDkGLdpnDV5FXjVObAgbSM0cnqYSGfRp7VGHBRqyoscvR4bcQ+CV9pDjbJ6S5rZn
# 1uA8hRhj09Hs33HRevt4oWAVYGItgEsG+BrCYbpgWMDEIVnAgPZEiPAaI8wBGemE
# 4feEkuz7TAwgkRBcUzLgQ4uvPqRD1A+Jkt26+pDqWYSn0MA8j0zacQk9q/AvciPX
# D9It2ez+mqEzgFRRsJGLtcf9HksvK8Jsd6I5zFShlqi5bpzf1Y4NOiNOh5QwW1pI
# vA5irlal7qFhkAeeeZqmop8+uNxZXxFCQG3R3s5pXW89FiCh9rmXrVqOCwgcXFIJ
# QAQkllKsI+UJqGq9rmRABJz5lHKTFYmFwcM52KWWjNx3z6odwz2h+sxaxewToe9G
# qtDx3/aU+yqNRcB8w0tSXUf+ylN4uk5xHEpLpx+ZNNsCAwEAAaOCAUkwggFFMB0G
# A1UdDgQWBBTfRqQzP3m9PZWuLf1p8/meFfkmmDAfBgNVHSMEGDAWgBSfpxVdAF5i
# XYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENB
# JTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRp
# bWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsF
# AAOCAgEAN0ajafILeL6SQIMIMAXM1Qd6xaoci2mOrpR8vKWyyTsL3b83A7XGLiAb
# QxTrqnXvVWWeNst5YQD8saO+UTgOLJdTdfUADhLXoK+RlwjfndimIJT9MH9tUYXL
# zJXKhZM09ouPwNsrn8YOLIpdAi5TPyN8Cl11OGZSlP9r8JnvomW00AoJ4Pl9rlg0
# G5lcQknAXqHa9nQdWp1ZxXqNd+0JsKmlR8tcANX33ClM9NnaClJExLQHiKeHUUWt
# qyLMl65TW6wRM7XlF7Y+PTnC8duNWn4uLng+ON/Z39GO6qBj7IEZxoq4o3avEh9b
# a43UU6TgzVZaBm8VaA0wSwUe/pqpTOYFWN62XL3gl/JC2pzfIPxP66XfRLIxafjB
# VXm8KVDn2cML9IvRK02s941Y5+RR4gSAOhLiQQ6A03VNRup+spMa0k+XTPAi+2aM
# H5xa1Zjb/K8u9f9M05U0/bUMJXJDP++ysWpJbVRDiHG7szaca+r3HiUPjQJyQl2N
# iOcYTGV/DcLrLCBK2zG503FGb04N5Kf10XgAwFaXlod5B9eKh95PnXKx2LNBgLwG
# 85anlhhGxxBQ5mFsJGkBn0PZPtAzZyfr96qxzpp2pH9DJJcjKCDrMmZziXazpa5V
# VN36CO1kDU4ABkSYTXOM8RmJXuQm7mUF3bWmj+hjAJb4pz6hT5UwggdxMIIFWaAD
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
# Hm5TaGllbGQgVFNTIEVTTjozNjA1LTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAb28KDG/xXbNB
# jmM7/nqw3bgrEOaggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDANBgkqhkiG9w0BAQsFAAIFAOspie8wIhgPMjAyNTAxMDgyMzM0MDdaGA8yMDI1
# MDEwOTIzMzQwN1owdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA6ymJ7wIBADAHAgEA
# AgIKqTAHAgEAAgITgzAKAgUA6yrbbwIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgor
# BgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUA
# A4IBAQCbodZ7Pb1mwCj2G1IGl/lPyTWeJ47OgUaM6Y7Y3Es+K2O+I17IqpzE4zUA
# MOUxzgMG0xHLsX2MZ7zVHMK6k4hVdH5OX7bUjsOdNU+ICw4Gt0MWGgMDVoq7g8An
# Uwi2qunDmeVFvteJFBNUTlorzT4JvNINF4cOVQgoHG6VEPNlY3QWq6hLCf11Ru0n
# pscdLNRP5jMZsQWv7pBu4DsbgP2dI4//EF82C8I2T8G788bT3OyZM3vI792Jh9Gg
# RHIiT0eyFcZdENMWBvo/DJZvM9mk0S4asHG7ntVDongqzkN0V4JHmQQmxkLAbpp2
# opdVrXIsKF3WLSaCeZa5rBC4N5WsMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAH3WCB1BMr7wvQAAQAAAfcwDQYJYIZIAWUD
# BAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0B
# CQQxIgQg+hUcyvtXDzJyHBic2FNlyG7ocyoef1SKLqQMkBC/5xswgfoGCyqGSIb3
# DQEJEAIvMYHqMIHnMIHkMIG9BCAh2pjaa3ca0ecYuhu60uYHP/IKnPbedbVQJ5So
# IH5Z4jCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB
# 91ggdQTK+8L0AAEAAAH3MCIEINMNhHNRkvrylXUcZSz7su05uE4QHFSi+/6mPpJE
# EVX4MA0GCSqGSIb3DQEBCwUABIICAKB1LV4m6Y1zHDVTHPTwwCmiaDn62ia77y9r
# std7q8tWrIouQzvTE7fAaWH0DFXRIVlayvyFt9MKUEWW2RE4r2ernL3+qe48dQ9j
# OxCnmkZ51wXDsAAGkVlab/zKz315tH6/t7BqI85V9iLl/AZjNgxhcQJeBgvqEcGw
# aVZNgKhU5o2Do91559+QHJ0z94PWQjgVWu9NyRVHjMUNBotbt+HVO2CCtOq9sSoQ
# yFcXftnQySA0DmL4IeuohXXIfm5giCRnP3HMuszf9tl2fkBnUTSfZkUyLVQuKcWG
# 4Fi4MZb1s/GpqnutQsFRBKtysxwQuY3V0OARIoWO9ZHkxBQ65Re6Hm3zqGiTS12z
# U6oIzPubgJptNf/eNne/qNgJfYv2Q4+DAhpB23Xjd7W2lUCyHxMMJSPh9S+yXo4M
# aIrrH+1Y1NLHGas4eCaex7eXavg3+XLxPrslQB1tOIVYx/DO99TV8q9VkkfLZHmk
# 3lB7YTnOI0UqAYVK/wol0H3Sbck4RQMVU1dZUUHszeA7/RDkfMTZyYUh/l2d6Eyv
# uTl12GIYYeKXfIo39fw/REwnBPbCeT7FFV3wBF7Rr1EKLEvIZXBNftAbOeaGLOZ0
# PtLYI8lNU3vJamybSjUEAkB/6dJsxjrc1e7KLTnHK0yK6LW8Je/qOr8IxervnaQr
# LBsu1Y0S
# SIG # End signature block
