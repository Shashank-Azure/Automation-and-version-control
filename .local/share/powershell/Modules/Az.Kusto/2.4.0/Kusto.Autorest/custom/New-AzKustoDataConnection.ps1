
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
Creates or updates a data connection.
.Description
Creates or updates a data connection.
.Example
$dataConnectionProperties = New-Object -Type Microsoft.Azure.PowerShell.Cmdlets.Kusto.Models.Api20240413.EventHubDataConnection -Property @{Location="East US"; Kind="EventHub"; EventHubResourceId="/subscriptions/$subscriptionId/resourcegroups/testrg/providers/Microsoft.EventHub/namespaces/myeventhubns/eventhubs/myeventhub"; DataFormat="JSON"; ConsumerGroup='Default'; Compression= "None"; TableName = "Events"; MappingRuleName = "EventsMapping"}
New-AzKustoDataConnection -ResourceGroupName "testrg" -ClusterName "testnewkustocluster" -DatabaseName "mykustodatabase" -DataConnectionName "mykustodataconnection" -Parameter $dataConnectionProperties

Kind     Location Name                                               Type
----     -------- ----                                               ----
EventHub East US  testnewkustocluster/mykustodatabase/mykustodataconnection Microsoft.Kusto/Clusters/Databases/DataConnections

.Link
https://learn.microsoft.com/powershell/module/az.kusto/new-azkustodataconnection
#>
function New-AzKustoDataConnection {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Kusto.Models.Api20240413.IDataConnection])]
    [CmdletBinding(DefaultParameterSetName = 'CreateExpandedEventHub', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Path')]
        [System.String]
        # The name of the Kusto cluster.
        ${ClusterName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Path')]
        [System.String]
        # The name of the database in the Kusto cluster.
        ${DatabaseName},

        [Parameter(Mandatory)]
        [Alias('DataConnectionName')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Path')]
        [System.String]
        # The name of the data connection.
        ${Name},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Path')]
        [System.String]
        # The name of the resource group containing the Kusto cluster.
        ${ResourceGroupName},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # Gets subscription credentials which uniquely identify Microsoft Azure subscription.
        # The subscription ID forms part of the URI for every service call.
        ${SubscriptionId},

        [Parameter(Mandatory)]
        [ArgumentCompleter( { param ( $CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters ) return @('EventHub', 'EventGrid', 'IotHub', 'CosmosDb') })]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Support.Kind]
        # Kind of the endpoint for the data connection
        ${Kind},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub', Mandatory)]
        [Parameter(ParameterSetName = 'CreateExpandedEventGrid', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The resource ID of the event hub to be used to create a data connection / event grid is configured to send events.
        ${EventHubResourceId},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub', Mandatory)]
        [Parameter(ParameterSetName = 'CreateExpandedEventGrid', Mandatory)]
        [Parameter(ParameterSetName = 'CreateExpandedIotHub', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The event/iot hub consumer group.
        ${ConsumerGroup},

        [Parameter(ParameterSetName = 'CreateExpandedEventGrid')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Support.BlobStorageEventType]
        # The name of blob storage event type to process.
        ${BlobStorageEventType},

        [Parameter(ParameterSetName = 'CreateExpandedEventGrid')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # If set to true, indicates that ingestion should ignore the first record of every file.
        ${IgnoreFirstRecord},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Parameter(ParameterSetName = 'CreateExpandedEventGrid')]
        [Parameter(ParameterSetName = 'CreateExpandedIotHub')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        [ValidateSet( "MULTIJSON", "JSON", "CSV", "TSV", "SCSV", "SOHSV", "PSV", "TXT", "RAW", "SINGLEJSON", "AVRO", "TSVE", "PARQUET", "ORC", "APACHEAVRO", "W3CLOGFILE")]
        # The data format of the message. Optionally the data format can be added to each message.
        ${DataFormat},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Parameter(ParameterSetName = 'CreateExpandedIotHub')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String[]]
        # System properties of the event/iot hub.
        ${EventSystemProperty},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The mapping rule to be used to ingest the data. Optionally the mapping information can be added to each message.
        ${MappingRuleName},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Parameter(ParameterSetName = 'CreateExpandedEventGrid')]
        [Parameter(ParameterSetName = 'CreateExpandedIotHub')]
        [Parameter(ParameterSetName = 'CreateExpandedCosmosDb', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The table where the data should be ingested. Optionally the table information can be added to each message.
        ${TableName},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Support.Compression]
        # The event hub messages compression type.
        ${Compression},

        [Parameter(ParameterSetName = 'CreateExpandedEventGrid', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The resource ID of the storage account where the data resides.
        ${StorageAccountResourceId},

        [Parameter(ParameterSetName = 'CreateExpandedIotHub', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The resource ID of the Iot hub to be used to create a data connection.
        ${IotHubResourceId},

        [Parameter(ParameterSetName = 'CreateExpandedIotHub', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The name of the share access policy.
        ${SharedAccessPolicyName},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Parameter(ParameterSetName = 'CreateExpandedEventGrid')]
        [Parameter(ParameterSetName = 'CreateExpandedCosmosDb', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The resource ID of a managed identity (system or user assigned) to be used to authenticate with external resources.
        ${ManagedIdentityResourceId},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Parameter(ParameterSetName = 'CreateExpandedEventGrid')]
        [Parameter(ParameterSetName = 'CreateExpandedIotHub')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Support.DatabaseRouting]
        # Indication for database routing information from the data connection, by default only database routing information is allowed.
        ${DatabaseRouting},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Parameter(ParameterSetName = 'CreateExpandedIotHub')]
        [Parameter(ParameterSetName = 'CreateExpandedCosmosDb')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.DateTime]
        # When defined, the data connection retrieves existing Event hub events created since the Retrieval start date. It can only retrieve events retained by the Event hub, based on its retention period.
        ${RetrievalStartDate},

        [Parameter(ParameterSetName = 'CreateExpandedEventGrid')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The resource ID of the event grid that is subscribed to the storage account events.
        ${EventGridResourceId},
        
        [Parameter(ParameterSetName = 'CreateExpandedCosmosDb', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The resource ID of the Cosmos DB account used to create the data connection.
        ${CosmosDbAccountResourceId},

        [Parameter(ParameterSetName = 'CreateExpandedCosmosDb', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The name of an existing database in the Cosmos DB account.
        ${CosmosDbDatabase},

        [Parameter(ParameterSetName = 'CreateExpandedCosmosDb', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # The name of an existing container in the Cosmos DB database.
        ${CosmosDbContainer},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Body')]
        [System.String]
        # Resource location.
        ${Location},

        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
            if ($PSBoundParameters['Kind'] -eq 'EventHub') {
                $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Models.Api20240413.EventHubDataConnection]::new()
                
                $Parameter.EventHubResourceId = $PSBoundParameters['EventHubResourceId']            
                $null = $PSBoundParameters.Remove('EventHubResourceId')

                if ($PSBoundParameters.ContainsKey('DataFormat')) {
                    $Parameter.DataFormat = $PSBoundParameters['DataFormat']
                    $null = $PSBoundParameters.Remove('DataFormat')
                }

                if ($PSBoundParameters.ContainsKey('ConsumerGroup')) {
                    $Parameter.ConsumerGroup = $PSBoundParameters['ConsumerGroup']
                    $null = $PSBoundParameters.Remove('ConsumerGroup')
                }

                if ($PSBoundParameters.ContainsKey('EventSystemProperty')) {
                    $Parameter.EventSystemProperty = $PSBoundParameters['EventSystemProperty']
                    $null = $PSBoundParameters.Remove('EventSystemProperty')
                }

                if ($PSBoundParameters.ContainsKey('Compression')) {
                    $Parameter.Compression = $PSBoundParameters['Compression']
                    $null = $PSBoundParameters.Remove('Compression')
                }

                if ($PSBoundParameters.ContainsKey('ManagedIdentityResourceId')) {
                    $Parameter.ManagedIdentityResourceId = $PSBoundParameters['ManagedIdentityResourceId']
                    $null = $PSBoundParameters.Remove('ManagedIdentityResourceId')
                }
                
                if ($PSBoundParameters.ContainsKey('DatabaseRouting')) {
                    $Parameter.DatabaseRouting = $PSBoundParameters['DatabaseRouting']
                    $null = $PSBoundParameters.Remove('DatabaseRouting')
                }
                
                if ($PSBoundParameters.ContainsKey('RetrievalStartDate')) {
                    $Parameter.RetrievalStartDate = $PSBoundParameters['RetrievalStartDate']
                    $null = $PSBoundParameters.Remove('RetrievalStartDate')
                }
            }
            elseif ($PSBoundParameters['Kind'] -eq 'EventGrid') {
                $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Models.Api20240413.EventGridDataConnection]::new()
            
                $Parameter.EventHubResourceId = $PSBoundParameters['EventHubResourceId']
                $null = $PSBoundParameters.Remove('EventHubResourceId')

                $Parameter.StorageAccountResourceId = $PSBoundParameters['StorageAccountResourceId']
                $null = $PSBoundParameters.Remove('StorageAccountResourceId')

                if ($PSBoundParameters.ContainsKey('DataFormat')) {
                    $Parameter.DataFormat = $PSBoundParameters['DataFormat']
                    $null = $PSBoundParameters.Remove('DataFormat')
                }

                if ($PSBoundParameters.ContainsKey('ConsumerGroup')) {
                    $Parameter.ConsumerGroup = $PSBoundParameters['ConsumerGroup']
                    $null = $PSBoundParameters.Remove('ConsumerGroup')
                }

                if ($PSBoundParameters.ContainsKey('BlobStorageEventType')) {
                    $Parameter.BlobStorageEventType = $PSBoundParameters['BlobStorageEventType']
                    $null = $PSBoundParameters.Remove('BlobStorageEventType')
                }

                if ($PSBoundParameters.ContainsKey('IgnoreFirstRecord')) {
                    $Parameter.IgnoreFirstRecord = $PSBoundParameters['IgnoreFirstRecord']
                    $null = $PSBoundParameters.Remove('IgnoreFirstRecord')
                }

                if ($PSBoundParameters.ContainsKey('EventGridResourceId')) {
                    $Parameter.EventGridResourceId = $PSBoundParameters['EventGridResourceId']
                    $null = $PSBoundParameters.Remove('EventGridResourceId')
                }

                if ($PSBoundParameters.ContainsKey('ManagedIdentityResourceId')) {
                    $Parameter.ManagedIdentityResourceId = $PSBoundParameters['ManagedIdentityResourceId']
                    $null = $PSBoundParameters.Remove('ManagedIdentityResourceId')
                }

                if ($PSBoundParameters.ContainsKey('DatabaseRouting')) {
                    $Parameter.DatabaseRouting = $PSBoundParameters['DatabaseRouting']
                    $null = $PSBoundParameters.Remove('DatabaseRouting')
                }
            }
            elseif ($PSBoundParameters['Kind'] -eq 'IotHub') {
                $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Models.Api20240413.IotHubDataConnection]::new()

                $Parameter.IotHubResourceId = $PSBoundParameters['IotHubResourceId']
                $null = $PSBoundParameters.Remove('IotHubResourceId')

                $Parameter.SharedAccessPolicyName = $PSBoundParameters['SharedAccessPolicyName']
                $null = $PSBoundParameters.Remove('SharedAccessPolicyName')

                if ($PSBoundParameters.ContainsKey('DataFormat')) {
                    $Parameter.DataFormat = $PSBoundParameters['DataFormat']
                    $null = $PSBoundParameters.Remove('DataFormat')
                }

                if ($PSBoundParameters.ContainsKey('ConsumerGroup')) {
                    $Parameter.ConsumerGroup = $PSBoundParameters['ConsumerGroup']
                    $null = $PSBoundParameters.Remove('ConsumerGroup')
                }

                if ($PSBoundParameters.ContainsKey('EventSystemProperty')) {
                    $Parameter.EventSystemProperty = $PSBoundParameters['EventSystemProperty']
                    $null = $PSBoundParameters.Remove('EventSystemProperty')
                }

                if ($PSBoundParameters.ContainsKey('DatabaseRouting')) {
                    $Parameter.DatabaseRouting = $PSBoundParameters['DatabaseRouting']
                    $null = $PSBoundParameters.Remove('DatabaseRouting')
                }

                if ($PSBoundParameters.ContainsKey('RetrievalStartDate')) {
                    $Parameter.RetrievalStartDate = $PSBoundParameters['RetrievalStartDate']
                    $null = $PSBoundParameters.Remove('RetrievalStartDate')
                }
            }
            elseif ($PSBoundParameters['Kind'] -eq 'CosmosDb') {
                $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Kusto.Models.Api20240413.CosmosDbDataConnection]::new()

                $Parameter.TableName = $PSBoundParameters['TableName']
                $null = $PSBoundParameters.Remove('TableName')

                $Parameter.ManagedIdentityResourceId = $PSBoundParameters['ManagedIdentityResourceId']
                $null = $PSBoundParameters.Remove('ManagedIdentityResourceId')

                $Parameter.CosmosDbAccountResourceId = $PSBoundParameters['CosmosDbAccountResourceId']
                $null = $PSBoundParameters.Remove('CosmosDbAccountResourceId')

                $Parameter.CosmosDbDatabase = $PSBoundParameters['CosmosDbDatabase']
                $null = $PSBoundParameters.Remove('CosmosDbDatabase')

                $Parameter.CosmosDbContainer = $PSBoundParameters['CosmosDbContainer']
                $null = $PSBoundParameters.Remove('CosmosDbContainer')

                if ($PSBoundParameters.ContainsKey('RetrievalStartDate')) {
                    $Parameter.RetrievalStartDate = $PSBoundParameters['RetrievalStartDate']
                    $null = $PSBoundParameters.Remove('RetrievalStartDate')
                }
            }

            $Parameter.Kind = $PSBoundParameters['Kind']
            $null = $PSBoundParameters.Remove('Kind')

            $Parameter.Location = $PSBoundParameters['Location']
            $null = $PSBoundParameters.Remove('Location')
            
            if ($PSBoundParameters.ContainsKey('MappingRuleName')) {
                $Parameter.MappingRuleName = $PSBoundParameters['MappingRuleName']
                $null = $PSBoundParameters.Remove('MappingRuleName')
            }

            if ($PSBoundParameters.ContainsKey('TableName')) {
                $Parameter.TableName = $PSBoundParameters['TableName']
                $null = $PSBoundParameters.Remove('TableName')
            }            

            $null = $PSBoundParameters.Add('Parameter', $Parameter)

            Az.Kusto.internal\New-AzKustoDataConnection @PSBoundParameters
        }
        catch {
            throw
        }
    }
}

# SIG # Begin signature block
# MIIoKgYJKoZIhvcNAQcCoIIoGzCCKBcCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBsNGWmCFhkol0V
# urPEaTAUK9tGQjrLw5sI5U13woXGsKCCDXYwggX0MIID3KADAgECAhMzAAAEBGx0
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIBK4b/ApcR3EtkQL/RvqrFU9
# A2dnI9juPot9CFcHvrHeMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAHgMdWB5h9glgZ+KSfPt1vkLRWJNebeXPnsIEU076+Qfq1IjZmh1tSxvi
# X19DLgqDpgblFCviNG+w3dsdOjHasrQiEOP1Y6zvs6NBfyQHyHKscD5z6VcC32Oj
# DlTakElakvV0YOMr9n/nUNkg5UDMhKho15Pet/SLbps1hMNK+vlV76Ki3qwBaTE1
# 2T7/cDufiOkyH+Nb/xN07K5olwNAE/9f9j3xgWS+0QIDREMJrwJ+QZakLO2Pkrt3
# nGDFDh4ybRKQTeDEKDlkIZymCUv1Cy+Mjgk8pbvsTOyXve0LhnKY0z4HA0Mua5WJ
# AIQqN8TE36fOMc2xERyLJL21dR85YaGCF5QwgheQBgorBgEEAYI3AwMBMYIXgDCC
# F3wGCSqGSIb3DQEHAqCCF20wghdpAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFSBgsq
# hkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCDrTyzSrhpR4bRcHj/K55RQ4bex5aGym2omPunH019CWwIGZ1rLfdLW
# GBMyMDI1MDEwOTA2MzY0Mi41NzlaMASAAgH0oIHRpIHOMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046QTkzNS0w
# M0UwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghHqMIIHIDCCBQigAwIBAgITMwAAAekPcTB+XfESNgABAAAB6TANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMzEyMDYxODQ1
# MjZaFw0yNTAzMDUxODQ1MjZaMIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25z
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046QTkzNS0wM0UwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCsmowxQRVgp4TSc3nTa6yrAPJnV6A7aZYnTw/yx90u
# 1DSH89nvfQNzb+5fmBK8ppH76TmJzjHUcImd845A/pvZY5O8PCBu7Gq+x5Xe6plQ
# t4xwVUUcQITxklOZ1Rm9fJ5nh8gnxOxaezFMM41sDI7LMpKwIKQMwXDctYKvCyQy
# 6kO2sVLB62kF892ZwcYpiIVx3LT1LPdMt1IeS35KY5MxylRdTS7E1Jocl30NgcBi
# JfqnMce05eEipIsTO4DIn//TtP1Rx57VXfvCO8NSCh9dxsyvng0lUVY+urq/G8QR
# FoOl/7oOI0Rf8Qg+3hyYayHsI9wtvDHGnT30Nr41xzTpw2I6ZWaIhPwMu5DvdkEG
# zV7vYT3tb9tTviY3psul1T5D938/AfNLqanVCJtP4yz0VJBSGV+h66ZcaUJOxpbS
# IjImaOLF18NOjmf1nwDatsBouXWXFK7E5S0VLRyoTqDCxHG4mW3mpNQopM/U1WJn
# jssWQluK8eb+MDKlk9E/hOBYKs2KfeQ4HG7dOcK+wMOamGfwvkIe7dkylzm8BeAU
# QC8LxrAQykhSHy+FaQ93DAlfQYowYDtzGXqE6wOATeKFI30u9YlxDTzAuLDK073c
# ndMV4qaD3euXA6xUNCozg7rihiHUaM43Amb9EGuRl022+yPwclmykssk30a4Rp3v
# 9QIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFJF+M4nFCHYjuIj0Wuv+jcjtB+xOMB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQBWsSp+rmsxFLe61AE90Ken2XPgQHJDiS4S
# bLhvzfVjDPDmOdRE75uQohYhFMdGwHKbVmLK0lHV1Apz/HciZooyeoAvkHQaHmLh
# wBGkoyAAVxcaaUnHNIUS9LveL00PwmcSDLgN0V/Fyk20QpHDEukwKR8kfaBEX83A
# yvQzlf/boDNoWKEgpdAsL8SzCzXFLnDozzCJGq0RzwQgeEBr8E4K2wQ2WXI/ZJxZ
# S/+d3FdwG4ErBFzzUiSbV2m3xsMP3cqCRFDtJ1C3/JnjXMChnm9bLDD1waJ7TPp5
# wYdv0Ol9+aN0t1BmOzCj8DmqKuUwzgCK9Tjtw5KUjaO6QjegHzndX/tZrY792dfR
# AXr5dGrKkpssIHq6rrWO4PlL3OS+4ciL/l8pm+oNJXWGXYJL5H6LNnKyXJVEw/1F
# bO4+Gz+U4fFFxs2S8UwvrBbYccVQ9O+Flj7xTAeITJsHptAvREqCc+/YxzhIKkA8
# 8Q8QhJKUDtazatJH7ZOdi0LCKwgqQO4H81KZGDSLktFvNRhh8ZBAenn1pW+5UBGY
# z2GpgcxVXKT1CuUYdlHR9D6NrVhGqdhGTg7Og/d/8oMlPG3YjuqFxidiIsoAw2+M
# hI1zXrIi56t6JkJ75J69F+lkh9myJJpNkx41sSB1XK2jJWgq7VlBuP1BuXjZ3qgy
# m9r1wv0MtTCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
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
# MCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOkE5MzUtMDNFMC1EOTQ3MSUwIwYDVQQD
# ExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQCr
# aYf1xDk2rMnU/VJo2GGK1nxo8aCBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6ymJpTAiGA8yMDI1MDEwODIzMzI1
# M1oYDzIwMjUwMTA5MjMzMjUzWjB0MDoGCisGAQQBhFkKBAExLDAqMAoCBQDrKYml
# AgEAMAcCAQACAiY0MAcCAQACAhO3MAoCBQDrKtslAgEAMDYGCisGAQQBhFkKBAIx
# KDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZI
# hvcNAQELBQADggEBAAQlwho/Cpc2tSYw1vt8Nusm/AJf/Yqg9evZ8PETElVrzhay
# zWqvq1NvLQUDBF/h2v4OUD3KLxjhCUKlA/o7mMBoFc7qpe/AyIaAE19CN0TkdcyL
# Ea/SMG0cUnkOoFF+Oo+eSKd3uznYnmYR9I06LuajHlThXy6N7GOr7J6gOB8vBmPs
# T7MG2CqyCfzRkz32sb2aUq0NAptBFpcJne91zFxwTUaXk5wQRyQe94HO9RW2NESk
# Z9EwvsW2ePzGIpcqLVg7IuOBlV/s89WyfkeoQqlWEdJ4LeuzNFzcn08O6mzom6HB
# rpKEVa7+cHp+6zz+CnEsBGgajWh5fn53NsRbIGoxggQNMIIECQIBATCBkzB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAekPcTB+XfESNgABAAAB6TAN
# BglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8G
# CSqGSIb3DQEJBDEiBCC1fk/NRL76OxlLoGDBptBmoKOJA8do/Me24xT5J99WszCB
# +gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIKSQkniXaTcmj1TKQWF+x2U4riVo
# rGD8TwmgVbN9qsQlMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldh
# c2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIw
# MTACEzMAAAHpD3Ewfl3xEjYAAQAAAekwIgQgVsI9sjr04+BLBnuWLK2e0f0duiPI
# futB9xw9G6dDkcIwDQYJKoZIhvcNAQELBQAEggIAZUeB4l0DBzSrbKSFa0tJywsR
# 25GlwHiZ9yFIkmNcJ4zWvXeTDnNlblKcHG6JdIRAyjWY7vovjhFyyFend1NoK7rb
# UxFAKtAcMXDy1W5eiaTEYbqpDAp3ZlQWG5/P1KylVsYKU5w9BdASvUz5zuBNC143
# JLo2TTy2u6V5xxjESTI/N42s6RdAWSU/g90UkrhVbtm9Uk29i0lcdbIcrbfiZ+nX
# 0dFe3Ri61GdirVUVsWfFr9rWywyaYrHShFWwBwL41r0S06pTJE2eSth8vC035RI3
# 1IeF1M/in8vgs8BIpIC0gLZKcgCfmUi+kdaLY/VLv5AlrPWb95aICm2QUJwId2rz
# 98CscvHHqffp9JURjHxNjnt2LT44UhTlESQ9nKF4eCX6p5phLQYUr1pvaNhAdTu/
# AWBde9nQ1YYu+vUnlMnaMzjbYfEJ5AzdpH11OLP11VzBwVlxtEtojpmWuM0KY/hd
# 21oCav8s7lAy68OQJWHIM7bOERVLNiXSKOZwocaF1jYlfHm82RifdN7yqk4VUcC8
# wDb2RxHOK/VgOYCtX9heY6zzlIMUc8lWvazFrEsM0d8ZY5ifGLX76dnNdnPO7yqh
# mZx2gKSAexXc36VsisIdeOhIidg3s5T2kkrDBH3wx8Nn5EkliZqUxOtzGou6ur0f
# xJ8//RARHGZSlKJRb3g=
# SIG # End signature block
