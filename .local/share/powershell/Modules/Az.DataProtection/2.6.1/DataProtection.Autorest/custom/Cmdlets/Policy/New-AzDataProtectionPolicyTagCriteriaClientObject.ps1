﻿function New-AzDataProtectionPolicyTagCriteriaClientObject{
	[OutputType('Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20240401.IScheduleBasedBackupCriteria')]
    [CmdletBinding(PositionalBinding=$false)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Description('Creates a new criteria object')]

    param(
        [Parameter(ParameterSetName='AbsoluteCriteria', Mandatory, HelpMessage='Absolute criteria')]
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.AbsoluteTagCriteria]
        ${AbsoluteCriteria},

        [Parameter(ParameterSetName='ScheduleCriteria', HelpMessage='Days of the week')]
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.DaysOfWeek[]]
        ${DaysOfWeek},

        [Parameter(ParameterSetName='ScheduleCriteria', HelpMessage='Weeks of the month.')]
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.WeeksOfMonth[]]
        ${WeeksOfMonth},

        [Parameter(ParameterSetName='ScheduleCriteria', HelpMessage='Months of the year.')]
        [Parameter(ParameterSetName='MonthlyCriteria', HelpMessage='Months of the year.')]
        [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Support.MonthsOfYear[]]
        ${MonthsOfYear},

        [Parameter(ParameterSetName='ScheduleCriteria', HelpMessage='Schedule times.')]
        [Parameter(ParameterSetName='MonthlyCriteria', HelpMessage='Schedule times.')]
        [System.DateTime[]]
        ${ScheduleTimes},

        [Parameter(ParameterSetName='MonthlyCriteria', Mandatory, HelpMessage='Days of the month. Allowed values are 1 to 28 and Last')]
        [System.String[]]
        ${DaysOfMonth}
    )

    process {
        $criteria = [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20240401.ScheduleBasedBackupCriteria]::new()
        $criteria.ObjectType = "ScheduleBasedBackupCriteria"
        if($AbsoluteCriteria -ne $null){
            $criteria.AbsoluteCriterion = $AbsoluteCriteria
        }

        if($DaysOfWeek -ne $null){
            $criteria.DaysOfTheWeek = $DaysOfWeek | Foreach-Object { $_ = $_.ToString(); $_ }
        }

        if($WeeksOfMonth -ne $null){
            $criteria.WeeksOfTheMonth = $WeeksOfMonth | Foreach-Object { $_ = $_.ToString(); $_ }
        }

        if($MonthsOfYear -ne $null){
            $criteria.MonthsOfYear = $MonthsOfYear | Foreach-Object { $_ = $_.ToString(); $_ }
        }

        if($DaysOfMonth -ne $null){
            $criteria.DaysOfMonth = @()
            Foreach($dayOfMonth in $DaysOfMonth)
            {
                if($dayOfMonth -match "^[\d]+$")
                {
                    $dayOfMonthNumber = [int]$dayOfMonth
                    if(($dayOfMonthNumber -lt 1) -or ($dayOfMonthNumber -gt 28))
                    {
                        throw "Day of month should be between 1 and 28."
                    }
                    $day = [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20240401.Day]::new()
                    $day.Date = $dayOfMonthNumber
                    $day.IsLast = $false
                    $criteria.DaysOfMonth += $day
                }
                else 
                {
                    if($dayOfMonth.ToLower() -ne "last")
                    {
                        thow "Day of month should either be between 1 and 28 or it should be last"
                    }
                    $day = [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20240401.Day]::new()
                    $day.IsLast = $true
                    $criteria.DaysOfMonth += $day
                }
            }
        }

        if($ScheduleTimes -ne $null){
            $criteria.ScheduleTime = $ScheduleTimes
        }


        return $criteria
    }
}
# SIG # Begin signature block
# MIIoUgYJKoZIhvcNAQcCoIIoQzCCKD8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCEK17yAqaU7joR
# XdiRmMcCRQNnnhi1AkxwH5ce76M4uaCCDYUwggYDMIID66ADAgECAhMzAAAEA73V
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
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIETE
# O/G4FAtWxnzHobJloT2mE6SMkuSohs3e89G3KUzCMEIGCisGAQQBgjcCAQwxNDAy
# oBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20wDQYJKoZIhvcNAQEBBQAEggEAkrQlmbGCVSZ4pOaDACAYtaltjloYYiUbeKwu
# ZbAfMdvIz7MNw35apGxz5+2b9mZk6Qhd/w/d1skjmYtKT7X1r6S1SmzIF4kOZhgE
# 50deYerEoaLMxqKo0YXToPOzl2OVh8GDw/jwC2tYSttKsnN15CJwMSraGvrm75nK
# CdMqlZzGt+548YQEcSeqVAmAzLwyHiNuu/MTlSpSfykNYOZbhctljwpMDzaphTw0
# d/e4PVcxwKgu5/8xwvBuLQwP9UmiZ7aUr0TaSw7tMyy/jk2x+0u56YZZynBT+NhR
# odvGNRPpz7ibGKn7L1Uz70gjWRid0oLwh6AZGUPlJo3STtbpSaGCF60wghepBgor
# BgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCCF4YwgheCAgEDMQ8wDQYJYIZI
# AWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkEggFFMIIBQQIBAQYKKwYBBAGE
# WQoDATAxMA0GCWCGSAFlAwQCAQUABCAU/2ivBWCCKWd0vjpJwQL2I8idjYXZw7D3
# 4jRQr5cH3gIGZ5qngq2pGBMyMDI1MDIwNjAzMTkwNy4yOTJaMASAAgH0oIHZpIHW
# MIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjoyRDFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggcoMIIFEKADAgECAhMzAAAB/XP5
# aFrNDGHtAAEAAAH9MA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMB4XDTI0MDcyNTE4MzExNloXDTI1MTAyMjE4MzExNlowgdMxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jv
# c29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMeblNoaWVs
# ZCBUU1MgRVNOOjJEMUEtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# oWWs+D+Ou4JjYnRHRedu0MTFYzNJEVPnILzc02R3qbnujvhZgkhp+p/lymYLzkQy
# G2zpxYceTjIF7HiQWbt6FW3ARkBrthJUz05ZnKpcF31lpUEb8gUXiD2xIpo8YM+S
# D0S+hTP1TCA/we38yZ3BEtmZtcVnaLRp/Avsqg+5KI0Kw6TDJpKwTLl0VW0/23sK
# ikeWDSnHQeTprO0zIm/btagSYm3V/8zXlfxy7s/EVFdSglHGsUq8EZupUO8XbHzz
# 7tURyiD3kOxNnw5ox1eZX/c/XmW4H6b4yNmZF0wTZuw37yA1PJKOySSrXrWEh+H6
# ++Wb6+1ltMCPoMJHUtPP3Cn0CNcNvrPyJtDacqjnITrLzrsHdOLqjsH229Zkvndk
# 0IqxBDZgMoY+Ef7ffFRP2pPkrF1F9IcBkYz8hL+QjX+u4y4Uqq4UtT7VRnsqvR/x
# /+QLE0pcSEh/XE1w1fcp6Jmq8RnHEXikycMLN/a/KYxpSP3FfFbLZuf+qIryFL0g
# EDytapGn1ONjVkiKpVP2uqVIYj4ViCjy5pLUceMeqiKgYqhpmUHCE2WssLLhdQBH
# dpl28+k+ZY6m4dPFnEoGcJHuMcIZnw4cOwixojROr+Nq71cJj7Q4L0XwPvuTHQt0
# oH7RKMQgmsy7CVD7v55dOhdHXdYsyO69dAdK+nWlyYcCAwEAAaOCAUkwggFFMB0G
# A1UdDgQWBBTpDMXA4ZW8+yL2+3vA6RmU7oEKpDAfBgNVHSMEGDAWgBSfpxVdAF5i
# XYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENB
# JTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRp
# bWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsF
# AAOCAgEAY9hYX+T5AmCrYGaH96TdR5T52/PNOG7ySYeopv4flnDWQLhBlravAg+p
# jlNv5XSXZrKGv8e4s5dJ5WdhfC9ywFQq4TmXnUevPXtlubZk+02BXK6/23hM0TSK
# s2KlhYiqzbRe8QbMfKXEDtvMoHSZT7r+wI2IgjYQwka+3P9VXgERwu46/czz8IR/
# Zq+vO5523Jld6ssVuzs9uwIrJhfcYBj50mXWRBcMhzajLjWDgcih0DuykPcBpoTL
# lOL8LpXooqnr+QLYE4BpUep3JySMYfPz2hfOL3g02WEfsOxp8ANbcdiqM31dm3vS
# heEkmjHA2zuM+Tgn4j5n+Any7IODYQkIrNVhLdML09eu1dIPhp24lFtnWTYNaFTO
# fMqFa3Ab8KDKicmp0AthRNZVg0BPAL58+B0UcoBGKzS9jscwOTu1JmNlisOKkVUV
# kSJ5Fo/ctfDSPdCTVaIXXF7l40k1cM/X2O0JdAS97T78lYjtw/PybuzX5shxBh/R
# qTPvCyAhIxBVKfN/hfs4CIoFaqWJ0r/8SB1CGsyyIcPfEgMo8ceq1w5Zo0JfnyFi
# 6Guo+z3LPFl/exQaRubErsAUTfyBY5/5liyvjAgyDYnEB8vHO7c7Fg2tGd5hGgYs
# +AOoWx24+XcyxpUkAajDhky9Dl+8JZTjts6BcT9sYTmOodk/SgIwggdxMIIFWaAD
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
# Hm5TaGllbGQgVFNTIEVTTjoyRDFBLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAoj0WtVVQUNSK
# oqtrjinRAsBUdoOggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDANBgkqhkiG9w0BAQsFAAIFAOtOX+8wIhgPMjAyNTAyMDUyMjA4NDdaGA8yMDI1
# MDIwNjIyMDg0N1owdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA605f7wIBADAHAgEA
# AgIO+TAHAgEAAgISJjAKAgUA60+xbwIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgor
# BgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUA
# A4IBAQArbpoS4TlltY9BOAX9nWfZBr6l3dTufFOZZa7/XPRoJ8SnFtlFdybRrv1A
# EYkL1FZr8irnLdXfyNv+HFIuyQwaSvxJeGLfIrDm1xqyLM0yEOfqod+Se06rqTf4
# L+3vemYZWSpcysnw7UJ78clWNitB4kNZ1B1yH8/MPOrpXo3QnowsFzxH6VyVg3GB
# g5PnY7PoyRrUUUILkHXd3Eml09FPWVduKJPJmQvV+/97R+MsNTtADjDDW6jBrRVz
# bGLxni3VcDGnN3/SCwThRyEvlql66nVL271FRysTOzj3HMnijSDGLyqLawimDSAw
# SodSIQckFWkbJCJswhY1dmuaizEdMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAH9c/loWs0MYe0AAQAAAf0wDQYJYIZIAWUD
# BAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0B
# CQQxIgQglVcd4yFiOuZ7nEXkN0+2Ur34tM8pYqBbwYf5irae8GEwgfoGCyqGSIb3
# DQEJEAIvMYHqMIHnMIHkMIG9BCCAKEgNyUowvIfx/eDfYSupHkeF1p6GFwjKBs8l
# RB4NRzCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB
# /XP5aFrNDGHtAAEAAAH9MCIEIMTnxE/8JEX029suH+LmDFQ1FOtnDQ47G2VdBcGP
# AF7dMA0GCSqGSIb3DQEBCwUABIICACQJilxttELeaGFJHmMmsIIQKvkqJDq6ChWM
# PkvvYdJvFWQ9hBI9WLPz7MiGBxJBpRYsNTjZhX7XUp6ekg2+otVL/uuf1e7cNxOX
# 6bAQ188Ie+r8WxWFkMUZidzx1aFumo5+gLjYn4qTjmAfZqHZ76cFCinSk1pegasP
# V5esn+dtqtAha/qN8hzI1l4j8HPuDPOVnTgdF1Uu9NZHKfyO2Ii3JZE8HAASYE7W
# x5xTVQsIILuw7nK4KjmdWS7DYAOT0sCJH9+YVX2BWqh0Jr1Ia+GoMjeY3cIm5GQq
# DFR68rEP1+pLl5mNW8eM+eAxHmTLeTDEdSKVpV8KganA0EO6yt5rkJMOXT8tNifd
# 1gSSPK7r22zOB0pBUz+oMbr6dBdcALAxFMKlAoI2P601XtOpoVmOdXJADdsT6hrJ
# fNqP5a+G0IP03MROmaUgFA0LuooZnv3HOlFh10/Rnv8aKbRmJQV9huB7znWn0Ed3
# 3lQej+By79/OzmJYly+/MPKvwq/FgEiqYvDla15kb+5jNZeeUrQbPcZ06MHRFolb
# 9tG5cfY+6NJAQQH11v8AGi4BPORpLltppSE4POZsKH3RYyoYlZ4gn8UCJChfHC2g
# O3Nh3tAm6qsmFiy1GDjEcIm4f/P2KtHvUFTmnHfk6d5/6VU67SZ5xKwpK7hCZQx7
# P5fQSP0b
# SIG # End signature block
