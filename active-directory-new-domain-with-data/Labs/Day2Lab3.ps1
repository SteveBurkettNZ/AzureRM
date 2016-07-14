<# EMS for CSP Course : Day 2 Lab 3

    MFA and Self-Service

#>

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# STEP 3: Enable MFA Individual user via PowerShell
    $UserCredential = Get-Credential
    Connect-MsolService -Credential $UserCredential
# Create Strong Authentication Object for Enabled
    $mfobject = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
    $mfobject.RelyingParty = "*"
    $mfobject.State = "Enabled"
    $mfaauthenabled = @($st)
# Enable MFA for user Allie B
    Set-MsolUser -UserPrincipalName AllieB@emsforcsp.com -StrongAuthenticationRequirements $mfaauthenabled 

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>

break

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# STEP 6 Enable MFA Bulk User via PowerShell
    $UserCredential = Get-Credential
    Connect-MsolService -Credential $UserCredential
# Create Strong Authentication Object for Enabled
    $mfobject = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
    $mfobject.RelyingParty = "*"
    $mfobject.State = “Enabled"
    $mfaauthenabled = @($mfobject)
# Create Strong Authentication Object for Disabled
    $mfauthdisabled = @()
# Import CSV
    $csvpath = “C:\Setup\Lab 3\MFA-Users.csv”
    $MFAUsers = Import-csv $csvpath
# Enable MFA for bulk users
    ForEach ($user in $MFAUsers) {
        switch ($user."MFA Status") {
            "Enabled" {
                    Set-MsolUser -UserPrincipalName $User.username -StrongAuthenticationRequirements $mfaauthenabled
                     }
            "Disabled" {
                   Set-MsolUser -UserPrincipalName $User.username -StrongAuthenticationRequirements $mfaauthdisabled
                    }
              }
        }

