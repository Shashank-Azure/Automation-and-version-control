
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
Updates the data connector.
.Description
Updates the data connector.

.Link
https://learn.microsoft.com/powershell/module/az.securityinsights/update-azsentineldataconnector
#>
function Update-AzSentinelDataConnector {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.DataConnector])]
    [CmdletBinding(DefaultParameterSetName = 'UpdateAADAATP', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesCloudTrail')]
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3')]
        [Parameter(ParameterSetName = 'UpdateAADAATP')]    
        [Parameter(ParameterSetName = 'UpdateAzureSecurityCenter')]
        [Parameter(ParameterSetName = 'UpdateDynamics365')]
        #[Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftDefenderAdvancedThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateOffice365')]
        [Parameter(ParameterSetName = 'UpdateOfficeATP')]
        [Parameter(ParameterSetName = 'UpdateOfficeIRM')]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = '(Get-AzContext).Subscription.Id')]
        [System.String]
        # Gets subscription credentials which uniquely identify Microsoft Azure subscription.
        # The subscription ID forms part of the URI for every service call.
        ${SubscriptionId},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesCloudTrail', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAADAATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAzureSecurityCenter', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateDynamics365', Mandatory)]
        #[Parameter(ParameterSetName = 'UpdateGenericUI', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftDefenderAdvancedThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOffice365', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOfficeATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOfficeIRM', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The Resource Group Name.
        ${ResourceGroupName},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesCloudTrail', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAADAATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAzureSecurityCenter', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateDynamics365', Mandatory)]
        #[Parameter(ParameterSetName = 'UpdateGenericUI', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftDefenderAdvancedThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOffice365', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOfficeATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOfficeIRM', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The name of the workspace.
        ${WorkspaceName},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesCloudTrail', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAADAATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateAzureSecurityCenter', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateDynamics365', Mandatory)]
        #[Parameter(ParameterSetName = 'UpdateGenericUI', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftDefenderAdvancedThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOffice365', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOfficeATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateOfficeIRM', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [System.String]
        # The Id of the Data Connector.
        ${Id},

        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesCloudTrail', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesS3', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAADAATP', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAzureSecurityCenter', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityDynamics365', Mandatory, ValueFromPipeline)]
        #[Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftCloudAppSecurity', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftDefenderAdvancedThreatProtection', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatIntelligence', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatProtection', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOffice365', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeATP', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeIRM', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligence', Mandatory, ValueFromPipeline)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii', Mandatory, ValueFromPipeline)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.ISecurityInsightsIdentity]
        # Identity Parameter
        # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
        ${InputObject},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesCloudTrail', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesCloudTrail', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${AWSCloudTrail},
        
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesS3', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${AWSS3},
        
        [Parameter(ParameterSetName = 'UpdateAADAATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAADAATP', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${AzureADorAATP},
        
        [Parameter(ParameterSetName = 'UpdateAzureSecurityCenter', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAzureSecurityCenter', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${AzureSecurityCenter},
        
        [Parameter(ParameterSetName = 'UpdateDynamics365', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityDynamics365', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${Dynamics365},
        
        #[Parameter(ParameterSetName = 'UpdateGenericUI', Mandatory)]
        #[Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI', Mandatory)]
        #[Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        #[System.Management.Automation.SwitchParameter]
        #${GenericUI},
        
        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftCloudAppSecurity', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${CloudAppSecurity},
        
        [Parameter(ParameterSetName = 'UpdateMicrosoftDefenderAdvancedThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftDefenderAdvancedThreatProtection', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${DefenderATP},

        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatIntelligence', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${MicrosoftTI},
        
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatProtection', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatProtection', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${MicrosoftThreatProtection},
        
        [Parameter(ParameterSetName = 'UpdateOffice365', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOffice365', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${Office365},
        
        [Parameter(ParameterSetName = 'UpdateOfficeATP', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeATP', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${OfficeATP},
        
        [Parameter(ParameterSetName = 'UpdateOfficeIRM', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeIRM', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${OfficeIRM},
        
        [Parameter(ParameterSetName = 'UpdateThreatIntelligence', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligence', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${ThreatIntelligence},
        
        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii', Mandatory)]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${ThreatIntelligenceTaxii},

        [Parameter(ParameterSetName = 'UpdateAADAATP')]
        [Parameter(ParameterSetName = 'UpdateDynamics365')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftDefenderAdvancedThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateOffice365')]
        [Parameter(ParameterSetName = 'UpdateOfficeATP')]
        [Parameter(ParameterSetName = 'UpdateOfficeIRM')]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesCloudTrail')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesS3')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAADAATP')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAzureSecurityCenter')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityDynamics365')]
        #[Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftCloudAppSecurity')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftDefenderAdvancedThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOffice365')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeATP')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeIRM')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = '(Get-AzContext).Tenant.Id')]
        [System.String]
        # The TenantId.
        ${TenantId},

        [Parameter(ParameterSetName = 'UpdateAzureSecurityCenter')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAzureSecurityCenter')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        # ASC Subscription Id.
        ${ASCSubscriptionId},

        [Parameter(ParameterSetName = 'UpdateAADAATP')]
        [Parameter(ParameterSetName = 'UpdateAzureSecurityCenter')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity')]
        [Parameter(ParameterSetName = 'UpdateMicrosoftDefenderAdvancedThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateOfficeATP')]
        [Parameter(ParameterSetName = 'UpdateOfficeIRM')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAADAATP')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAzureSecurityCenter')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftCloudAppSecurity')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftDefenderAdvancedThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeATP')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOfficeIRM')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Alerts},

        [Parameter(ParameterSetName = 'UpdateDynamics365')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityDynamics365')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${CommonDataServiceActivity},

        [Parameter(ParameterSetName = 'UpdateMicrosoftCloudAppSecurity')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftCloudAppSecurity')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${DiscoveryLog},

        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatIntelligence')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${BingSafetyPhishinURL},

        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatIntelligence')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [ValidateSet('OneDay', 'OneWeek', 'OneMonth', 'All')]
        [System.String]
        ${BingSafetyPhishingUrlLookbackPeriod},

        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatIntelligence')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${MicrosoftEmergingThreatFeed},

        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatIntelligence')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [ValidateSet('OneDay', 'OneWeek', 'OneMonth', 'All')]
        [System.String]
        ${MicrosoftEmergingThreatFeedLookbackPeriod},

        [Parameter(ParameterSetName = 'UpdateMicrosoftThreatProtection')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityMicrosoftThreatProtection')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Incident},

        [Parameter(ParameterSetName = 'UpdateOffice365')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOffice365')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Exchange},

        [Parameter(ParameterSetName = 'UpdateOffice365')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOffice365')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${SharePoint},

        [Parameter(ParameterSetName = 'UpdateOffice365')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityOffice365')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Teams},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligence')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligence')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Indicator},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${WorkspaceId},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${FriendlyName},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${APIRootURL},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${CollectionId},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${UserName},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Password},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [ValidateSet('OneDay', 'OneWeek', 'OneMonth', 'All')]
        [System.String]
        ${TaxiiLookbackPeriod},

        [Parameter(ParameterSetName = 'UpdateThreatIntelligenceTaxii')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityThreatIntelligenceTaxii')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.PollingFrequency])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.PollingFrequency]
        ${PollingFrequency},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesCloudTrail')]
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesCloudTrail')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesS3')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${AWSRoleArn},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesCloudTrail')]
        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesCloudTrail')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesS3')]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Support.DataTypeState])]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${Log},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesS3')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [String[]]
        ${SQSURL},

        [Parameter(ParameterSetName = 'UpdateAmazonWebServicesS3')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityAmazonWebServicesS3')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${DetinationTable},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${UiConfigTitle},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${UiConfigPublisher},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${UiConfigDescriptionMarkdown},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${UiConfigCustomImage},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [System.String]
        ${UiConfigGraphQueriesTableName},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.GraphQueries[]]
        ${UiConfigGraphQuery},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.SampleQueries[]]
        ${UiConfigSampleQuery},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.LastDataReceivedDataType[]]
        ${UiConfigDataType},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.ConnectivityCriteria[]]
        ${UiConfigConnectivityCriterion},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Bool]
        ${AvailabilityIsPreview},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.DefaultInfo(Script = 1)]
        [Int]
        ${AvailabilityStatus},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.PermissionsResourceProviderItem[]] 
        ${PermissionResourceProvider},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.PermissionsCustomsItem[]]
        ${PermissionCustom},

        [Parameter(ParameterSetName = 'UpdateGenericUI')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityGenericUI')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Models.Api20210901Preview.InstructionSteps[]]
        ${UiConfigInstructionStep},

        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.SecurityInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
            #Handle Get
            $GetPSBoundParameters = @{}
            if ($PSBoundParameters['InputObject']) {
                $GetPSBoundParameters.Add('InputObject', $PSBoundParameters['InputObject'])
            }
            else {
                $GetPSBoundParameters.Add('ResourceGroupName', $PSBoundParameters['ResourceGroupName'])
                $GetPSBoundParameters.Add('WorkspaceName', $PSBoundParameters['WorkspaceName'])
                $GetPSBoundParameters.Add('Id', $PSBoundParameters['Id'])
            }
            $DataConnector = Az.SecurityInsights\Get-AzSentinelDataConnector @GetPSBoundParameters


            if ($DataConnector.Kind -eq 'AzureActiveDirectory') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }
                If ($PSBoundParameters['Alerts']) {
                    $DataConnector.AlertState = $PSBoundParameters['Alerts']
                    $null = $PSBoundParameters.Remove('Alerts')
                }

                $null = $PSBoundParameters.Remove('AzureADorAATP')
            }
            if ($DataConnector.Kind -eq 'AzureAdvancedThreatProtection') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }
                If ($PSBoundParameters['Alerts']) {
                    $DataConnector.AlertState = $PSBoundParameters['Alerts']
                    $null = $PSBoundParameters.Remove('Alerts')
                }
                $null = $PSBoundParameters.Remove('AzureADorAATP')
            }
            if ($DataConnector.Kind -eq 'Dynamics365') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }

                If ($PSBoundParameters['CommonDataServiceActivity']) {
                    $DataConnector.Dynamics365CdActivityState = $PSBoundParameters['CommonDataServiceActivity']
                    $null = $PSBoundParameters.Remove('CommonDataServiceActivity')
                }
                $null = $PSBoundParameters.Remove('Dynamics365')
            }
            if ($DataConnector.Kind -eq 'MicrosoftCloudAppSecurity') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }

                If ($PSBoundParameters['Alerts']) {
                    $DataConnector.DataTypeAlertState = $PSBoundParameters['Alerts']
                    $null = $PSBoundParameters.Remove('Alerts')
                }

                If ($PSBoundParameters['DiscoveryLog']) {
                    $DataConnector.DiscoveryLogState = $PSBoundParameters['DiscoveryLog']
                    $null = $PSBoundParameters.Remove('DiscoveryLog')
                }
                $null = $PSBoundParameters.Remove('CloudAppSecurity')
            }
            if ($DataConnector.Kind -eq 'MicrosoftDefenderAdvancedThreatProtection') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }

                If ($PSBoundParameters['Alerts']) {
                    $DataConnector.AlertState = $PSBoundParameters['Alerts']
                    $null = $PSBoundParameters.Remove('Alerts')
                }
                $null = $PSBoundParameters.Remove('DefenderATP')
            }
            if ($DataConnector.Kind -eq 'MicrosoftThreatIntelligence') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }
                
                If ($PSBoundParameters['BingSafetyPhishinURL']) {
                    $DataConnector.BingSafetyPhishingUrlState = $PSBoundParameters['BingSafetyPhishinURL']
                    $null = $PSBoundParameters.Remove('BingSafetyPhishinURL')
                }

                If ($PSBoundParameters['BingSafetyPhishingUrlLookbackPeriod']) {
                    if ($PSBoundParameters['BingSafetyPhishingUrlLookbackPeriod'] -eq 'OneDay') {
                        $DataConnector.BingSafetyPhishingUrlLookbackPeriod = ((Get-Date).AddDays(-1).ToUniversalTime() | Get-DAte -Format yyyy-MM-ddTHH:mm:ss.fffZ).ToString()
                    }
                    elseif ($PSBoundParameters['BingSafetyPhishingUrlLookbackPeriod'] -eq 'OneWeek') {
                        $DataConnector.BingSafetyPhishingUrlLookbackPeriod = ((Get-Date).AddDays(-7).ToUniversalTime() | Get-DAte -Format yyyy-MM-ddTHH:mm:ss.fffZ).ToString()
                    }
                    elseif ($PSBoundParameters['BingSafetyPhishingUrlLookbackPeriod'] -eq 'OneMonth') {
                        $DataConnector.BingSafetyPhishingUrlLookbackPeriod = ((Get-Date).AddMonths(-1).ToUniversalTime() | Get-DAte -Format yyyy-MM-ddTHH:mm:ss.fffZ).ToString()
                    }
                    elseif ($PSBoundParameters['BingSafetyPhishingUrlLookbackPeriod'] -eq 'All') {
                        $DataConnector.BingSafetyPhishingUrlLookbackPeriod = "1970-01-01T00:00:00.000Z"
                    }
                    $null = $PSBoundParameters.Remove('BingSafetyPhishingUrlLookbackPeriod')
                }
                
                If ($PSBoundParameters['MicrosoftEmergingThreatFeed']) {
                    $DataConnector.MicrosoftEmergingThreatFeedState = $PSBoundParameters['MicrosoftEmergingThreatFeed']
                    $null = $PSBoundParameters.Remove('MicrosoftEmergingThreatFeed')
                }
                
                If ($PSBoundParameters['MicrosoftEmergingThreatFeedLookbackPeriod']) {
                    if ($PSBoundParameters['MicrosoftEmergingThreatFeedLookbackPeriod'] -eq 'OneDay') {
                        $DataConnector.MicrosoftEmergingThreatFeedLookbackPeriod = ((Get-Date).AddDays(-1).ToUniversalTime() | Get-DAte -Format yyyy-MM-ddTHH:mm:ss.fffZ).ToString()
                    }
                    elseif ($PSBoundParameters['MicrosoftEmergingThreatFeedLookbackPeriod'] -eq 'OneWeek') {
                        $DataConnector.MicrosoftEmergingThreatFeedLookbackPeriod = ((Get-Date).AddDays(-7).ToUniversalTime() | Get-DAte -Format yyyy-MM-ddTHH:mm:ss.fffZ).ToString()
                    }
                    elseif ($PSBoundParameters['MicrosoftEmergingThreatFeedLookbackPeriod'] -eq 'OneMonth') {
                        $DataConnector.MicrosoftEmergingThreatFeedLookbackPeriod = ((Get-Date).AddMonths(-1).ToUniversalTime() | Get-DAte -Format yyyy-MM-ddTHH:mm:ss.fffZ).ToString()
                    }
                    elseif ($PSBoundParameters['MicrosoftEmergingThreatFeedLookbackPeriod'] -eq 'All') {
                        $DataConnector.MicrosoftEmergingThreatFeedLookbackPeriod = "1970-01-01T00:00:00.000Z"
                    }
                    $null = $PSBoundParameters.Remove('MicrosoftEmergingThreatFeedLookbackPeriod')
                }
                $null = $PSBoundParameters.Remove('MicrosoftTI')
            }
            if ($DataConnector.Kind -eq 'MicrosoftThreatProtection') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }

                If ($PSBoundParameters['Incident']) {
                    $DataConnector.IncidentState = $PSBoundParameters['Incident']
                    $null = $PSBoundParameters.Remove('Incident')
                }
                $null = $PSBoundParameters.Remove('MicrosoftThreatProtection')
            }
            if ($DataConnector.Kind -eq 'Office365') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }

                If ($PSBoundParameters['Exchange']) {
                    $DataConnector.ExchangeState = $PSBoundParameters['Exchange']
                    $null = $PSBoundParameters.Remove('Exchange')
                }

                If ($PSBoundParameters['SharePoint']) {
                    $DataConnector.SharePointState = $PSBoundParameters['SharePoint']
                    $null = $PSBoundParameters.Remove('SharePoint')
                }

                If ($PSBoundParameters['Teams']) {
                    $DataConnector.TeamState = $PSBoundParameters['Teams']
                    $null = $PSBoundParameters.Remove('Teams')
                }
                $null = $PSBoundParameters.Remove('Office365')
            }
            if ($DataConnector.Kind -eq 'OfficeATP') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }
                
                If ($PSBoundParameters['Alerts']) {
                    $DataConnector.AlertState = $PSBoundParameters['Alerts']
                    $null = $PSBoundParameters.Remove('Alerts')
                }
                $null = $PSBoundParameters.Remove('OfficeATP')
            }
            if ($DataConnector.Kind -eq 'OfficeIRM') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }
                
                If ($PSBoundParameters['Alerts']) {
                    $DataConnector.AlertState = $PSBoundParameters['Alerts']
                    $null = $PSBoundParameters.Remove('Alerts')
                }
                $null = $PSBoundParameters.Remove('OfficeIRM')
            }
            if ($DataConnector.Kind -eq 'ThreatIntelligence') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }
                
                If ($PSBoundParameters['Indicator']) {
                    $DataConnector.IndicatorState = $PSBoundParameters['Indicator']
                    $null = $PSBoundParameters.Remove('Indicator')
                }
                $null = $PSBoundParameters.Remove('ThreatIntelligence')
            }
            if ($DataConnector.Kind -eq 'ThreatIntelligenceTaxii') {
                If ($PSBoundParameters['TenantId']) {
                    $DataConnector.TenantId = $PSBoundParameters['TenantId']
                    $null = $PSBoundParameters.Remove('TenantId')
                }

                If ($PSBoundParameters['FriendlyName']) {
                    $DataConnector.FriendlyName = $PSBoundParameters['FriendlyName']
                    $null = $PSBoundParameters.Remove('FriendlyName')
                }

                If ($PSBoundParameters['APIRootURL']) {
                    $DataConnector.TaxiiServer = $PSBoundParameters['APIRootURL']
                    $null = $PSBoundParameters.Remove('APIRootURL')
                }

                If ($PSBoundParameters['CollectionId']) {
                    $DataConnector.CollectionId = $PSBoundParameters['CollectionId']
                    $null = $PSBoundParameters.Remove('CollectionId')
                }

                If ($PSBoundParameters['UserName']) {
                    $DataConnector.UserName = $PSBoundParameters['UserName']
                    $null = $PSBoundParameters.Remove('UserName')
                }

                If ($PSBoundParameters['Password']) {
                    $DataConnector.Password = $PSBoundParameters['Password']
                    $null = $PSBoundParameters.Remove('Password')
                }

                If ($PSBoundParameters['WorkspaceId']) {
                    $DataConnector.WorkspaceId = $PSBoundParameters['WorkspaceId']
                    $null = $PSBoundParameters.Remove('WorkspaceId')
                }
                
                if ($PSBoundParameters['PollingFrequency']) {
                    if ($PSBoundParameters['PollingFrequency'] -eq 'OnceADay') {
                        $DataConnector.PollingFrequency = "OnceADay"
                    }
                    elseif ($PSBoundParameters['PollingFrequency'] -eq 'OnceAMinute') {
                        $DataConnector.PollingFrequency = "OnceAMinute"
                    }
                    elseif ($PSBoundParameters['PollingFrequency'] -eq 'OnceAnHour') {
                        $DataConnector.PollingFrequency = "OnceAnHour"
                    }
                    $null = $PSBoundParameters.Remove('PollingFrequency')
                }
                $null = $PSBoundParameters.Remove('ThreatIntelligenceTaxii')
            }
            if ($DataConnector.Kind -eq 'AzureSecurityCenter') {
                If ($PSBoundParameters['ASCSubscriptionId']) {
                    $DataConnector.SubscriptionId = $PSBoundParameters['ASCSubscriptionId']
                    $null = $PSBoundParameters.Remove('ASCSubscriptionId')
                }

                If ($PSBoundParameters['Alerts']) {
                    $DataConnector.AlertState = $PSBoundParameters['Alerts']
                    $null = $PSBoundParameters.Remove('Alerts')
                }
                $null = $PSBoundParameters.Remove('AzureSecurityCenter')
            }
            if ($DataConnector.Kind -eq 'AmazonWebServicesCloudTrail') {
                If ($PSBoundParameters['AWSRoleArn']) {
                    $DataConnector.AWSRoleArn = $PSBoundParameters['AWSRoleArn']
                    $null = $PSBoundParameters.Remove('AWSRoleArn')
                }

                If ($PSBoundParameters['Log']) {
                    $DataConnector.LogState = $PSBoundParameters['Log']
                    $null = $PSBoundParameters.Remove('Log')
                }
                $null = $PSBoundParameters.Remove('AWSCloudTrail')            
            }
            if ($DataConnector.Kind -eq 'AmazonWebServicesS3') {
                If ($PSBoundParameters['AWSRoleArn']) {
                    $DataConnector.AWSRoleArn = $PSBoundParameters['AWSRoleArn']
                    $null = $PSBoundParameters.Remove('AWSRoleArn')
                }

                If ($PSBoundParameters['Log']) {
                    $DataConnector.LogState = $PSBoundParameters['Log']
                    $null = $PSBoundParameters.Remove('Log')
                }
                
                If ($PSBoundParameters['SQSURL']) {
                    $DataConnector.SqsUrl = $PSBoundParameters['SQSURL']
                    $null = $PSBoundParameters.Remove('SQSURL')
                }
                If ($PSBoundParameters['DetinationTable']) {
                    $DataConnector.DestinationTable = $PSBoundParameters['DetinationTable']
                    $null = $PSBoundParameters.Remove('DetinationTable')
                }
                $null = $PSBoundParameters.Remove('AWSS3')
            }
            if ($DataConnector.Kind -eq 'GenericUI') {
                If ($PSBoundParameters['UiConfigTitle']) {
                    $DataConnector.ConnectorUiConfigTitle = $PSBoundParameters['UiConfigTitle']
                    $null = $PSBoundParameters.Remove('UiConfigTitle')
                }
                If ($PSBoundParameters['UiConfigPublisher']) {
                    $DataConnector.ConnectorUiConfigPublisher = $PSBoundParameters['UiConfigPublisher']
                    $null = $PSBoundParameters.Remove('UiConfigPublisher')
                }        
                If ($PSBoundParameters['UiConfigDescriptionMarkdown']) {
                    $DataConnector.ConnectorUiConfigDescriptionMarkdown = $PSBoundParameters['UiConfigDescriptionMarkdown']
                    $null = $PSBoundParameters.Remove('UiConfigDescriptionMarkdown')
                }
                If ($PSBoundParameters['UiConfigCustomImage']) {
                    $DataConnector.ConnectorUiConfigCustomImage = $PSBoundParameters['UiConfigCustomImage']
                    $null = $PSBoundParameters.Remove('UiConfigCustomImage')
                }
                If ($PSBoundParameters['UiConfigGraphQueriesTableName']) {
                    $DataConnector.ConnectorUiConfigGraphQueriesTableName = $PSBoundParameters['UiConfigGraphQueriesTableName']
                    $null = $PSBoundParameters.Remove('UiConfigGraphQueriesTableName')
                }
                If ($PSBoundParameters['UiConfigGraphQuery']) {
                    $DataConnector.ConnectorUiConfigGraphQuery = $PSBoundParameters['UiConfigGraphQuery']
                    $null = $PSBoundParameters.Remove('UiConfigGraphQuery')
                }
                If ($PSBoundParameters['UiConfigSampleQuery']) {
                    $DataConnector.ConnectorUiConfigSampleQuery = $PSBoundParameters['UiConfigSampleQuery']
                    $null = $PSBoundParameters.Remove('UiConfigSampleQuery')
                }
                If ($PSBoundParameters['UiConfigDataType']) {
                    $DataConnector.ConnectorUiConfigDataType = $PSBoundParameters['UiConfigDataType']
                    $null = $PSBoundParameters.Remove('UiConfigDataType')
                }
                If ($PSBoundParameters['UiConfigConnectivityCriterion']) {
                    $DataConnector.ConnectorUiConfigConnectivityCriterion = $PSBoundParameters['UiConfigConnectivityCriterion']
                    $null = $PSBoundParameters.Remove('UiConfigConnectivityCriterion')
                }
                If ($PSBoundParameters['AvailabilityIsPreview']) {
                    $DataConnector.AvailabilityIsPreview = $PSBoundParameters['AvailabilityIsPreview']
                    $null = $PSBoundParameters.Remove('AvailabilityIsPreview')
                }
                If ($PSBoundParameters['AvailabilityStatus']) {
                    $DataConnector.AvailabilityStatus = $PSBoundParameters['AvailabilityStatus']
                    $null = $PSBoundParameters.Remove('AvailabilityStatus')
                }
                If ($PSBoundParameters['PermissionResourceProvider']) {
                    $DataConnector.PermissionResourceProvider = $PSBoundParameters['PermissionResourceProvider']
                    $null = $PSBoundParameters.Remove('PermissionResourceProvider')
                }
                If ($PSBoundParameters['PermissionCustom']) {
                    $DataConnector.DestinationTable = $PSBoundParameters['PermissionCustom']
                    $null = $PSBoundParameters.Remove('PermissionCustom')
                }
                If ($PSBoundParameters['UiConfigInstructionStep']) {
                    $DataConnector.ConnectorUiConfigInstructionStep = $PSBoundParameters['UiConfigInstructionStep']
                    $null = $PSBoundParameters.Remove('UiConfigInstructionStep')
                }
            }
    
            $null = $PSBoundParameters.Add('DataConnector', $DataConnector)
            Az.SecurityInsights.internal\Update-AzSentinelDataConnector @PSBoundParameters
        }
        catch {
            throw
        }
    }
}
# SIG # Begin signature block
# MIIoOQYJKoZIhvcNAQcCoIIoKjCCKCYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBoBEIDjP6Y4iuc
# 4706lO6boOqaNIiD9hqQxiaHaNGNk6CCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEILkZ
# 81/RRQSVqAfB0qnkR/kW3cm2U/GtTq7+2lNRr8NAMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAKdhRpvcAyLFAcHqhQc4cDZ8DcLy6GsUyo/eF
# 3KGdGZJVKPbSpjBNV5qwEOTvaXJS22i6pVf2aLN+phZrHHdaQpDfjMS52vIiQwTt
# mfclv1ofHoqpDOqyZxhxmdBP7OSMewcrr2q9qBfvqc6iTWrq0A0nScHXQaAazhe/
# zjrNQ7AQG2H3iosgfaA77O1IS1OFu+bheA7pKui3D9JJjz1r2mU5sJWSOR53LQIE
# CCQNvwDpb6xehhhmiuGIDrV/+mnhKjjq626chYZSSE4Pq/zturua2zJNiecCV68S
# ydhKu7FMkg2A8PstqnCmVNt2uThgtmjCIWOkk2vWXNCNDfYtlqGCF5QwgheQBgor
# BgEEAYI3AwMBMYIXgDCCF3wGCSqGSIb3DQEHAqCCF20wghdpAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFSBgsqhkiG9w0BCRABBKCCAUEEggE9MIIBOQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCD24DYiDEVSTxMK789spbDufh59k3yrxsmQ
# 7U3ihiCuVQIGZ1rou12tGBMyMDI1MDEwOTA2Mzc0Ni4xNTlaMASAAgH0oIHRpIHO
# MIHLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQL
# ExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxk
# IFRTUyBFU046REMwMC0wNUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFNlcnZpY2WgghHqMIIHIDCCBQigAwIBAgITMwAAAehQsIDPK3KZTQAB
# AAAB6DANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDAeFw0yMzEyMDYxODQ1MjJaFw0yNTAzMDUxODQ1MjJaMIHLMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1l
# cmljYSBPcGVyYXRpb25zMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046REMwMC0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Uw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDhQXdE0WzXG7wzeC9SGdH6
# eVwdGlF6YgpU7weOFBkpW9yuEmJSDE1ADBx/0DTuRBaplSD8CR1QqyQmxRDD/Cdv
# DyeZFAcZ6l2+nlMssmZyC8TPt1GTWAUt3GXUU6g0F0tIrFNLgofCjOvm3G0j482V
# utKS4wZT6bNVnBVsChr2AjmVbGDN/6Qs/EqakL5cwpGel1te7UO13dUwaPjOy0Wi
# 1qYNmR8i7T1luj2JdFdfZhMPyqyq/NDnZuONSbj8FM5xKBoar12ragC8/1CXaL1O
# MXBwGaRoJTYtksi9njuq4wDkcAwitCZ5BtQ2NqPZ0lLiQB7O10Bm9zpHWn9x1/Hm
# dAn4koMWKUDwH5sd/zDu4vi887FWxm54kkWNvk8FeQ7ZZ0Q5gqGKW4g6revV2IdA
# xBobWdorqwvzqL70WdsgDU/P5c0L8vYIskUJZedCGHM2hHIsNRyw9EFoSolDM+yC
# edkz69787s8nIp55icLfDoKw5hak5G6MWF6d71tcNzV9+v9RQKMa6Uwfyquredd5
# sqXWCXv++hek4A15WybIc6ufT0ilazKYZvDvoaswgjP0SeLW7mvmcw0FELzF1/uW
# aXElLHOXIlieKF2i/YzQ6U50K9dbhnMaDcJSsG0hXLRTy/LQbsOD0hw7FuK0nmzo
# tSx/5fo9g7fCzoFjk3tDEwIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFPo5W8o980kM
# fRVQba6T34HwelLaMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8G
# A1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMv
# Y3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBs
# BggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUy
# MDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUH
# AwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQCWfcJm2rwXtPi7
# 4km6PKAkni9+BWotq+QtDGgeT5F3ro7PsIUNKRkUytuGqI8thL3Jcrb03x6DOppY
# JEA+pb6o2qPjFddO1TLqvSXrYm+OgCLL+7+3FmRmfkRu8rHvprab0O19wDbukgO8
# I5Oi1RegMJl8t5k/UtE0Wb3zAlOHnCjLGSzP/Do3ptwhXokk02IvD7SZEBbPboGb
# tw4LCHsT2pFakpGOBh+ISUMXBf835CuVNfddwxmyGvNSzyEyEk5h1Vh7tpwP7z7r
# J+HsiP4sdqBjj6Avopuf4rxUAfrEbV6aj8twFs7WVHNiIgrHNna/55kyrAG9Yt19
# CPvkUwxYK0uZvPl2WC39nfc0jOTjivC7s/IUozE4tfy3JNkyQ1cNtvZftiX3j5Dt
# +eLOeuGDjvhJvYMIEkpkV68XLNH7+ZBfYa+PmfRYaoFFHCJKEoRSZ3PbDJPBiEhZ
# 9yuxMddoMMQ19Tkyftot6Ez0XhSmwjYBq39DvBFWhlyDGBhrU3GteDWiVd9YGSB2
# WnxuFMy5fbAK6o8PWz8QRMiptXHK3HDBr2wWWEcrrgcTuHZIJTqepNoYlx9VRFvj
# /vCXaAFcmkW1nk7VE+owaXr5RJjryDq9ubkyDq1mdrF/geaRALXcNZbfNXIkhXzX
# A6a8CiamcQW/DgmLJpiVQNriZYCHIDCCB3EwggVZoAMCAQICEzMAAAAVxedrngKb
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
# Y2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOkRDMDAtMDVF
# MC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMK
# AQEwBwYFKw4DAhoDFQCMJG4vg0juMOVn2BuKACUvP80FuqCBgzCBgKR+MHwxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6ymm5TAi
# GA8yMDI1MDEwOTAxMzc0MVoYDzIwMjUwMTEwMDEzNzQxWjB0MDoGCisGAQQBhFkK
# BAExLDAqMAoCBQDrKablAgEAMAcCAQACAgkfMAcCAQACAhJBMAoCBQDrKvhlAgEA
# MDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAI
# AgEAAgMBhqAwDQYJKoZIhvcNAQELBQADggEBAEpuvqYAWimE3aR+q2KcX9oSBl2V
# bkx7buLha6IStST4ztD6i7OuKIKiHh2ybmm70omfWKv/4kYvcgElPrlgNhgzwyFX
# V7uRX1SkPMbH9B+5oj9ZWOKE81lgSX0UNsgWlL92N7nGQN3G+J/4ZP3sjZdcdC6j
# 7nqd82IucomvfqPBKX5UFFDRNzuxSI2vme97A73cqQ6aHzVw9h1pChOmLz62Cud0
# nA3xAB6CZIi+Qa2hx2J1IoroWK7dSDndNOjk5ZCMQAhcmdbr4uqkC1ySFtNJbQfp
# 1GGE1vFiI3sNIKbe84XCu894GtoRsrGZuN1mOWMN3cTuM+1ec0q6je5corAxggQN
# MIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAehQ
# sIDPK3KZTQABAAAB6DANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0G
# CyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCBMzkRq04+2+j870URf1nACYsi9
# 45qenjwW90wtliJ47TCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EICrS2sTV
# AoQggkHR59pNqige0xfJT2J3U8W1Sc8H+OsdMIGYMIGApH4wfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAHoULCAzytymU0AAQAAAegwIgQgQV0pW5tg
# GS+yeJmO/KxxySGk1pYFhPEuT2ZdSh5D128wDQYJKoZIhvcNAQELBQAEggIATuup
# ZEYWra7hrs7LI031cWe+L8vg+sBKXGTl+goSCLygE46KDseyIgO4YFjUOp8V+9NT
# SDfe1OCAxyQIC7pOjFY/2rcYRGFhNIQtdkU2hy4XxRpbUyiS7HyjPWylTZHfyafw
# Ki6wr+TSZyCT+olrL9wL9Ga5h32vfUiIbYdTvFqeR6+aa1c+zW2mnuJirq70UZz+
# ws947pTg9VVxSg85JhTtgfDy5CKXsou7YdP940Df9yzF0nwqs4mZNZuHOSJrhx6w
# 6PZGTK/YBuYCa9omcPraizETVen0C2l+EuM3X0CqIdfEp7wGVCfJHy7W6zE3FxM8
# cHUqvuJL1S+EMMy8bjaMdSz78JXUIJksSu60GaqU2Dd6DX2X81PpPXxrXpsc7UKs
# e/iZjEuqz2tjJv4ooP5oJk+BhbFNiSIO/Ig3+hGXPOG30dk2cUNw8wC2d1OUOpfp
# I2Zpg4k9CBmwdQDNLoxVq8DFUsjXT35laDz+PrqRqECVpoXASkLY0y29s6mOTiYO
# DbzRBdWz6YcWh1ZSp2KgvootTdejfKMQeeZbqcxVaS8IZ5MjnIl+znUYXITiptox
# RBfO57PotXiZ8UrF7a+trmVkbyQeC7acBduD4j2Vt1kAKhbIsSjXmZT4/WbOJWmm
# wqALdNc7UgblB5Nrw/IRTA5y543jPWKt45WKFBQ=
# SIG # End signature block
