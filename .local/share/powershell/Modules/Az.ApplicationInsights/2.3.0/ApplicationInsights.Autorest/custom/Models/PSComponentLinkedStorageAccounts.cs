﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

namespace Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Models
{
    public class PSComponentLinkedStorageAccounts
    {
        public PSComponentLinkedStorageAccounts(string id = default(string), string name = default(string), string type = default(string), string linkedStorageAccount = default(string))
        {
            this.Id = id;
            this.Name = name;
            this.Type = type;
            this.LinkedStorageAccount = linkedStorageAccount;
        }

        public string Id { get; private set; }

        public string Name { get; private set; }

        public string Type { get; private set; }

        public string LinkedStorageAccount { get; set; }
    }
}