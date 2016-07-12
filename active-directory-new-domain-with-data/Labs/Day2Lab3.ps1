<# EMS for CSP Course : Day 2 Lab 3

    MFA and Self-Service

#>

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# STEP 3: Enable MFA Individual user via PowerShell
$UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential

$st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
$st.RelyingParty = "*"
$st.State = "Enabled"
$sta = @($st)

# Enable MFA for user Allie B
Set-MsolUser -UserPrincipalName AllieB@emsforcsp.com -StrongAuthenticationRequirements $sta 

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>

break

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# STEP 4 Enable MFA Bulk User via PowerShell
$UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential

# Bulk MFA Import
$st = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
$st.RelyingParty = "*"
$st.State = “Enabled"
$sta = @($st)
$csvpath = “C:\cspdemoems MFA Users.csv”
$MFAUsers = Import-csv $csvpath

ForEach ($user in $MFAUsers.username) {
Set-MsolUser -UserPrincipalName $User -StrongAuthenticationRequirements $sta
}
