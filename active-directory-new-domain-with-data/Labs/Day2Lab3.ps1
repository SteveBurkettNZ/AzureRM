<# EMS for CSP Course : Day 2 Lab 3

    MFA and Self-Service

#>

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# STEP 3: Enable MFA Individual user via PowerShell
    $UserCredential = Get-Credential
    Connect-MsolService -Credential $UserCredential
# Create Secure Token
    $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
    $st.RelyingParty = "*"
    $st.State = "Enabled"
    $sta = @($st)
# Enable MFA for user Allie B
    Set-MsolUser -UserPrincipalName AllieB@emsforcsp.com -StrongAuthenticationRequirements $sta 

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>

break

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# STEP 6 Enable MFA Bulk User via PowerShell
    $UserCredential = Get-Credential
    Connect-MsolService -Credential $UserCredential
# Create Secure Token
    $st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
    $st.RelyingParty = "*"
    $st.State = “Enabled"
    $sta = @($st)
# Import CSV
    $csvpath = “C:\Setup\Lab 3\MFA-Users.csv”
    $MFAUsers = Import-csv $csvpath
# Enable MFA for bulk users
    ForEach ($user in $MFAUsers.username) {
        Set-MsolUser -UserPrincipalName $User -StrongAuthenticationRequirements $sta
        }
