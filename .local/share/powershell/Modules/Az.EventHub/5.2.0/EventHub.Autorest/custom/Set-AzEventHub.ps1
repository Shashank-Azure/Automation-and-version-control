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
Updates an EventHub Entity
.Description
Updates an EventHub Entity
#>

function Set-AzEventHub{

    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.IEventHub])]
    [CmdletBinding(DefaultParameterSetName = 'SetExpanded', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
	param(
        [Parameter(ParameterSetName = 'SetExpanded', Mandatory, HelpMessage = "The name of EventHub Entity.")]
        [Alias('EventHubName')]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Path')]
        [System.String]
        # The name of EventHub Entity.
        ${Name},

        [Parameter(ParameterSetName = 'SetExpanded', Mandatory, HelpMessage = "The name of EventHub namespace.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Path')]
        [System.String]
        # The name of EventHub namespace
        ${NamespaceName},

        [Parameter(ParameterSetName = 'SetExpanded', Mandatory, HelpMessage = "The name of the resource group. The name is case insensitive.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},

        [Parameter(ParameterSetName = 'SetExpanded', HelpMessage = "The ID of the target subscription.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # The ID of the target subscription.
        ${SubscriptionId},

        [Parameter(ParameterSetName = 'SetViaIdentityExpanded', Mandatory, ValueFromPipeline, HelpMessage = "Identity parameter. To construct, see NOTES section for INPUTOBJECT properties and create a hash table.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Models.IEventHubIdentity]
        # Identity Parameter
        # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
        ${InputObject},

        [Parameter(HelpMessage = "A value that indicates whether capture description is enabled.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # A value that indicates whether capture description is enabled.
        ${CaptureEnabled},

        [Parameter(HelpMessage = "Enumerates the possible values for the encoding format of capture description. Note: 'AvroDeflate' will be deprecated in New API Version")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        #Enumerates the possible values for the encoding format of capture description. Note: 'AvroDeflate' will be deprecated in New API Version
        ${Encoding},

        [Parameter(HelpMessage = "The time window allows you to set the frequency with which the capture to Azure Blobs will happen, value should between 60 to 900 seconds")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.Int32]
        # The time window allows you to set the frequency with which the capture to Azure Blobs will happen, value should between 60 to 900 seconds
        ${IntervalInSeconds},

        [Parameter(HelpMessage = "The size window defines the amount of data built up in your Event Hub before an capture operation, value should be between 10485760 to 524288000 bytes")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.Int32]
        # The size window defines the amount of data built up in your Event Hub before an capture operation, value should be between 10485760 to 524288000 bytes
        ${SizeLimitInBytes},

        [Parameter(HelpMessage = "A value that indicates whether to Skip Empty Archives")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # A value that indicates whether to Skip Empty Archives
        ${SkipEmptyArchive},

        [Parameter(HelpMessage = "Number of hours to retain the events for this Event Hub. This value is only used when cleanupPolicy is Delete. If cleanupPolicy is Compaction the returned value of this property is Long.MaxValue")]
		[Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
		[System.Int64]
		# Number of hours to retain the events for this Event Hub. This value is only used when cleanupPolicy is Delete. If cleanupPolicy is Compaction the returned value of this property is Long.MaxValue
		${RetentionTimeInHour},

        [Parameter(HelpMessage = "Number of hours to retain the tombstone markers of a compacted Event Hub. This value is only used when cleanupPolicy is Compaction. Consumer must complete reading the tombstone marker within this specified amount of time if consumer begins from starting offset to ensure they get a valid snapshot for the specific key described by the tombstone marker within the compacted Event Hub")]
		[Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
		[System.Int32]
        ${TombstoneRetentionTimeInHour},

        [Parameter(HelpMessage = "Enumerates the possible values for the status of the Event Hub.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        # Enumerates the possible values for the status of the Event Hub.
        ${Status},

        [Parameter(HelpMessage = "Gets and Sets Metadata of User.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        ${UserMetadata},

        [Parameter(HelpMessage = "The minimum time a message will remain ineligible for compaction in the log.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
		[System.Int64]
        ${MinCompactionLagInMin},

        [Parameter(HelpMessage = "Denotes the type of timestamp the message will hold.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        ${TimestampType},

        [Parameter(HelpMessage = "Name for capture destination")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        ${DestinationName},

        [Parameter(HelpMessage = "Type of managed service identity.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        ${IdentityType},

        [Parameter(HelpMessage = "Properties for User Assigned Identities")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        # Name for capture destination
        ${UserAssignedIdentityId},

        [Parameter(HelpMessage = "Number of partitions created for the Event Hub. allowed values are from 1 to 32 partitions.")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.Int64]
        ${PartitionCount},

        [Parameter(HelpMessage = "Resource id of the storage account to be used to create the blobs")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        # Resource id of the storage account to be used to create the blobs
        ${StorageAccountResourceId},
        
        [Parameter(HelpMessage = "Blob naming convention for archive, e.g. {Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}. Here all the parameters (Namespace,EventHub .. etc) are mandatory irrespective of order")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        # Blob naming convention for archive, e.g. {Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}. Here all the parameters (Namespace,EventHub .. etc) are mandatory irrespective of order
        ${ArchiveNameFormat},

        [Parameter(HelpMessage = "Blob container Name")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Body')]
        [System.String]
        # Blob container Name
        ${BlobContainer},

        [Parameter(HelpMessage = "The credentials, account, tenant, and subscription used for communication with Azure.")]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter(HelpMessage = "Run the command as a job")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter(HelpMessage = "Run the command asynchronously")]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.EventHub.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
	)
	process{
		try{
            $hasCaptureEnabled = $PSBoundParameters.Remove('CaptureEnabled')
            $hasEncoding = $PSBoundParameters.Remove('Encoding')
            $hasIntervalInSeconds = $PSBoundParameters.Remove('IntervalInSeconds')
            $hasSizeLimitInBytes = $PSBoundParameters.Remove('SizeLimitInBytes')
            $hasSkipEmptyArchive = $PSBoundParameters.Remove('SkipEmptyArchive')
            $hasUserAssignedIdentityId = $PSBoundParameters.Remove('UserAssignedIdentityId')
            $hasIdentityType = $PSBoundParameters.Remove('IdentityType')
            $hasRetentionTimeInHour = $PSBoundParameters.Remove('RetentionTimeInHour')
            $hasTombstoneRetentionTimeInHour = $PSBoundParameters.Remove('TombstoneRetentionTimeInHour')
            $hasStatus = $PSBoundParameters.Remove('Status')
            $hasDestinationName = $PSBoundParameters.Remove('DestinationName')
            $hasStorageAccountResourceId = $PSBoundParameters.Remove('StorageAccountResourceId')
            $hasArchiveNameFormat = $PSBoundParameters.Remove('ArchiveNameFormat')
            $hasBlobContainer = $PSBoundParameters.Remove('BlobContainer')
            $hasAsJob = $PSBoundParameters.Remove('AsJob')
            $hasPartitionCount = $PSBoundParameters.Remove('PartitionCount')
            $hasUserMetadata = $PSBoundParameters.Remove('UserMetadata')
            $hasMinCompactionLagInMin = $PSBoundParameters.Remove('MinCompactionLagInMin')
            $hasTimestampType = $PSBoundParameters.Remove('TimestampType')
            $null = $PSBoundParameters.Remove('WhatIf')
            $null = $PSBoundParameters.Remove('Confirm')

            $eventHub = Get-AzEventHub @PSBoundParameters

            # 2. PUT
            $null = $PSBoundParameters.Remove('InputObject')
            $null = $PSBoundParameters.Remove('ResourceGroupName')
            $null = $PSBoundParameters.Remove('NamespaceName')
            $null = $PSBoundParameters.Remove('Name')
            $null = $PSBoundParameters.Remove('SubscriptionId')

            $hasProperty = $false

            if ($hasCaptureEnabled) {
                $eventHub.CaptureEnabled = $CaptureEnabled
                $hasProperty = $true
            }

            if ($hasEncoding) {
                $eventHub.Encoding = $Encoding
                $hasProperty = $true
            }

            if ($hasIntervalInSeconds) {
                $eventHub.IntervalInSeconds = $IntervalInSeconds
                $hasProperty = $true
            }

            if($hasPartitionCount) {
                $eventHub.PartitionCount = $PartitionCount
                $hasProperty = $true
            }

            if ($hasSizeLimitInBytes) {
                $eventHub.SizeLimitInBytes = $SizeLimitInBytes
                $hasProperty = $true
            }

            if ($hasSkipEmptyArchive) {
                $eventHub.SkipEmptyArchive = $SkipEmptyArchive
                $hasProperty = $true
            }

            if($hasTombstoneRetentionTimeInHour) {
                $eventHub.TombstoneRetentionTimeInHour = $TombstoneRetentionTimeInHour
                $hasProperty = $true
            }

            if ($hasRetentionTimeInHour) {
                $eventHub.RetentionTimeInHour = $RetentionTimeInHour
                $hasProperty = $true
            }

            if ($hasStatus) {
                $eventHub.Status = $Status
                $hasProperty = $true
            }

            if ($hasDestinationName) {
                $eventHub.DestinationName = $DestinationName
                $hasProperty = $true
            }

            if ($hasIdentityType) {
                $eventHub.IdentityType = $IdentityType
            }

            if ($hasUserAssignedIdentityId) {
                $eventHub.UserAssignedIdentityId = $UserAssignedIdentityId
            }

            if($hasUserMetadata) {
                $eventHub.UserMetadata = $UserMetadata
                $hasProperty = $true
            }

            if($hasMinCompactionLagInMin) {
                $eventHub.MinCompactionLagInMin = $MinCompactionLagInMin
                $hasProperty = $true
            }

            if($hasTimestampType) {
                $eventHub.TimestampType = $TimestampType
                $hasProperty = $true
            }

            if ($hasStorageAccountResourceId) {
                $eventHub.StorageAccountResourceId = $StorageAccountResourceId
                $hasProperty = $true
            }

            if ($hasArchiveNameFormat) {
                $eventHub.ArchiveNameFormat = $ArchiveNameFormat
                $hasProperty = $true
            }

            if ($hasBlobContainer) {
                $eventHub.BlobContainer = $BlobContainer
                $hasProperty = $true
            }

            if (($hasProperty -eq $false) -and ($PSCmdlet.ParameterSetName -eq 'SetViaIdentityExpanded')){
                throw 'Please specify the property you want to update on the -InputObject. Refer https://go.microsoft.com/fwlink/?linkid=2204690#behavior-of--inputobject for example.'
            }

            if ($hasAsJob) {
                $PSBoundParameters.Add('AsJob', $true)
            }

            if ($PSCmdlet.ShouldProcess("EventHub Entity $($eventHub.Name)", "Create or update")) {
                Az.EventHub.private\New-AzEventHub_CreateViaIdentity -InputObject $eventHub -Parameter $eventHub @PSBoundParameters
            }
		}
		catch{
			throw
		}
	}
}

# SIG # Begin signature block
# MIIoOQYJKoZIhvcNAQcCoIIoKjCCKCYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDAQqgfCcMfeFyc
# PjMcy+OU353qw2/9jCgRXmkj7ZtoN6CCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEILeu
# 860dD4YialIcjiPPs2KKzNG1rugiySwVmCvezfLCMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAg+9KkQSXDsZbYi+fAGzPAOkAc2DnnMBS4On2
# Y/HP107AV4LEODGU07OnRE1XAcyBvHtnLXbaT23qqWvrj9/Qg3RB7shyQARkJCqr
# mipPSp8OcmzrPOXZ5yA3K9wKwY6howQsonCDAq2ZJ1IqPhPwV/7gsFagI6exoPrv
# sxAlEwPKKyoA57Jos2PeCGJLR5fLW27P/tE6lRJm1tm6KN8Q+F0Hjb+i44DapUye
# O45iMLhDzX7prD9aaIT3bY/VkTD8uwEtALCpvx5VhwdAbd9+76sZDeqVcwtkDUMz
# ZDxL2d2TXcgyziATkGTLw1uNAUJfJmIbOI0XZWmD5CkTHk0Yx6GCF5QwgheQBgor
# BgEEAYI3AwMBMYIXgDCCF3wGCSqGSIb3DQEHAqCCF20wghdpAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCCMoTjRPeJmyyunPSos+7PBEh0QpRaxn/NQ
# mnHKHpSFbAIGZ4kE24doGBMyMDI1MDIwNjAzMTkwOS4zMzhaMASAAgH0oIHRpIHO
# MIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQL
# ExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxk
# IFRTUyBFU046OTYwMC0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFNlcnZpY2WgghHqMIIHIDCCBQigAwIBAgITMwAAAe+JP1ahWMyo2gAB
# AAAB7zANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDAeFw0yMzEyMDYxODQ1NDhaFw0yNTAzMDUxODQ1NDhaMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046OTYwMC0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCjC1jinwzgHwhOakZqy17o
# E4BIBKsm5kX4DUmCBWI0lFVpEiK5mZ2Kh59soL4ns52phFMQYGG5kypCipungwP9
# Nob4VGVE6aoMo5hZ9NytXR5ZRgb9Z8NR6EmLKICRhD4sojPMg/RnGRTcdf7/TYvy
# M10jLjmLyKEegMHfvIwPmM+AP7hzQLfExDdqCJ2u64Gd5XlnrFOku5U9jLOKk1y7
# 0c+Twt04/RLqruv1fGP8LmYmtHvrB4TcBsADXSmcFjh0VgQkX4zXFwqnIG8rgY+z
# DqJYQNZP8O1Yo4kSckHT43XC0oM40ye2+9l/rTYiDFM3nlZe2jhtOkGCO6GqiTp5
# 0xI9ITpJXi0vEek8AejT4PKMEO2bPxU63p63uZbjdN5L+lgIcCNMCNI0SIopS4ga
# VR4Sy/IoDv1vDWpe+I28/Ky8jWTeed0O3HxPJMZqX4QB3I6DnwZrHiKn6oE38tgB
# TCCAKvEoYOTg7r2lF0Iubt/3+VPvKtTCUbZPFOG8jZt9q6AFodlvQntiolYIYtqS
# rLyXAQIlXGhZ4gNcv4dv1YAilnbWA9CsnYh+OKEFr/4w4M69lI+yaoZ3L/t/UfXp
# T/+yc7hS/FolcmrGFJTBYlS4nE1cuKblwZ/UOG26SLhDONWXGZDKMJKN53oOLSSk
# 4ldR0HlsbT4heLlWlOElJQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFO1MWqKFwrCb
# trw9P8A63bAVSJzLMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQAYGZa3aCDudbk9
# EVdkP8xcQGZuIAIPRx9K1CA7uRzBt80fC0aWkuYYhQMvHHJRHUobSM4Uw3zN7fHE
# N8hhaBDb9NRaGnFWdtHxmJ9eMz6Jpn6KiIyi9U5Og7QCTZMl17n2w4eddq5vtk4r
# RWOVvpiDBGJARKiXWB9u2ix0WH2EMFGHqjIhjWUXhPgR4C6NKFNXHvWvXecJ2WXr
# JnvvQGXAfNJGETJZGpR41nUN3ijfiCSjFDxamGPsy5iYu904Hv9uuSXYd5m0Jxf2
# WNJSXkPGlNhrO27pPxgT111myAR61S3S2hc572zN9yoJEObE98Vy5KEM3ZX53cLe
# fN81F1C9p/cAKkE6u9V6ryyl/qSgxu1UqeOZCtG/iaHSKMoxM7Mq4SMFsPT/8ieO
# dwClYpcw0CjZe5KBx2xLa4B1neFib8J8/gSosjMdF3nHiyHx1YedZDtxSSgegeJs
# i0fbUgdzsVMJYvqVw52WqQNu0GRC79ZuVreUVKdCJmUMBHBpTp6VFopL0Jf4Srgg
# +zRD9iwbc9uZrn+89odpInbznYrnPKHiO26qe1ekNwl/d7ro2ItP/lghz0DoD7kE
# GeikKJWHdto7eVJoJhkrUcanTuUH08g+NYwG6S+PjBSB/NyNF6bHa/xR+ceAYhcj
# x0iBiv90Mn0JiGfnA2/hLj5evhTcAjCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
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
# Y2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjk2MDAtMDVF
# MC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMK
# AQEwBwYFKw4DAhoDFQBLcI81gxbea1Ex2mFbXx7ck+0g/6CBgzCBgKR+MHwxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA606ISDAi
# GA8yMDI1MDIwNjAxMDA1NloYDzIwMjUwMjA3MDEwMDU2WjB0MDoGCisGAQQBhFkK
# BAExLDAqMAoCBQDrTohIAgEAMAcCAQACAgO5MAcCAQACAhLlMAoCBQDrT9nIAgEA
# MDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAI
# AgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAL/T4st8h/KrJIZU09Gy9vUQdUbW
# 3xUcE3BTdd+qu/2Mi4w98dboo3K1JsvmQoxi/cwtgD75yA6A8ENKsRawicHXIpIG
# L8GjMI4Xjky6IVsAE3+eb2TJgpvWtLQi8CrwBD8MD6ufXd6rKWg7fG5Sf/d45rR7
# YoqQlPEFuKSIN0hTYApvKbAEmzg2nPcfcOAsmpw78MBUbvZwEPB/1tZsbGEUd+Wd
# WI/IqkChg9lYKEpP834sJX8OVPXjH8U4zfEkkeAFQjiwqjaN3aDrt9fRSwZGFmoW
# Sm5Vtild+8M5V9pJFYvVJawnqrOM6fnMhHqzAcjiMbGe4ROV6rOH89BVmBUxggQN
# MIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAe+J
# P1ahWMyo2gABAAAB7zANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0G
# CyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCB1YhgnuMuaRCy8S6wxFhm4H0mS
# 4fe8QVSS4wVSoiycqzCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIPBhKEW4
# Fo3wUz09NQx2a0DbcdsX8jovM5LizHmnyX+jMIGYMIGApH4wfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAHviT9WoVjMqNoAAQAAAe8wIgQgxgYtD/4X
# eKr1vvg4SxCXP1/TCWxfQvdnWUxz/kC9EO0wDQYJKoZIhvcNAQELBQAEggIAi4la
# z/Jpjt7TlWkOQtK4nzEd331KSG0KAbcceicFaAAqfywTaO0BUkBZCcxoxe/BmwhX
# 3UdoENhtLDsSWGk1xKbnkqzB+dbL87vG5v2LJZ9FfP0WBfWj3kn5ZxJzqSaZjslT
# T7uFE680YUHgIVWA36qd7CvXyJFF+vTN0dCuWfoJPVO4ZO+yrClFesvmypL1vhdB
# 8SyrR3Ll4FWofLJrwKwO97+hp3jldlsGdhYvkMgGNgP3ZtiShtp/mweVXOeOOfEb
# o1zxsecxbQVUSDofS6qmUqVuUhzHTcqr8uDENWl+3Da58CjgM3ntSdFLXnL1x1BX
# MYlCpQZ4GqOGhgAVceqAWRfzCniKbtpvyrNhO5tN5iaKi7FZiH9ZoyMvdB7kBEsn
# VXz7kGXHPj4ZfS8vITupa0pp/p1/knqaVTkGoj28c2t8GB/ZKBX3MoxX9qD5JUv9
# cgKiplSl6ptO/geMfEZ/j7zW4yNplaXZRsMP6w1+1xL1Qqlmc+ErVvtTCYkVsn6x
# ez9q68DM6awKlaWWKxv1TI5icg5z3paxlAUxNFXleYvMQPujqiE6RoK6J+SyXVa4
# wYf1vTQGuQNkPymU4UE3UwOcL20UBhTyx2ysTWFvo5oCT2wM+v/WbycvfikigsNq
# VMtJxzNjj51oetd1345GytXSqJogWz6QKxmXaS4=
# SIG # End signature block
