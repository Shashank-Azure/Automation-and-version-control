// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.

namespace Microsoft.Azure.PowerShell.Cmdlets.Migrate.Models.Api20240901
{
    public class AzLocalNicInput
    {
        public AzLocalNicInput(
            string nicId,
            string targetNetworkId,
            string testNetworkId,
            string selectionTypeForFailover)
        {
            NicId = nicId;
            TargetNetworkId = targetNetworkId;
            TestNetworkId = testNetworkId;
            SelectionTypeForFailover = selectionTypeForFailover;
        }

        /// <summary>Gets or sets the NIC Id.</summary>
        public string NicId { get; set; }

        /// <summary>Gets or sets the target network Id within Azure Local Cluster.</summary>
        public string TargetNetworkId { get; set; }

        /// <summary>Gets or sets the target test network Id within Azure Local Cluster.</summary>
        public string TestNetworkId { get; set; }

        /// <summary>Gets or sets the selection type of the NIC.</summary>
        public string SelectionTypeForFailover { get; set; }
    }
}