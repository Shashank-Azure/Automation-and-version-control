// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.

using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Azure.PowerShell.Cmdlets.Support.Models;

namespace Microsoft.Azure.PowerShell.Cmdlets.Support.Cmdlets
{
    public partial class UpdateAzSupportTicketsNoSubscription_UpdateViaIdentityExpanded
    {
        partial void overrideOnDefault(HttpResponseMessage responseMessage, Task<IErrorResponse> errorResponseTask, ref Task<bool> returnNow)
        {
            this.WriteError(responseMessage, errorResponseTask, ref returnNow);
        }
    }
}