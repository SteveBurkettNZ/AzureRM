<# EMS for CSP Course : Day 2 Lab 2

    Azure AD Connect

#>

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# Step 2:  Prepare the Azure Active Directory Connect Service Account
    $MSOLDomain = 'mod411530.onmicrosoft.com'

# To connect to Azure Active Directory
    $msolcred = get-credential
    connect-msolservice -credential $msolcred

# Create Office 365 Service Account for Azure AD Connect
    New-MsolUser -UserPrincipalName "SVC_AADConnect@$MSOLDomain" -DisplayName SVC_AADConnect -FirstName SVC_AADConnect -Password "P@ssw0rd" -PasswordNeverExpires $True -ForceChangePassword $false
    Add-MsolRoleMember -RoleName "Company Administrator" -RoleMemberEmailAddress "SVC_AADConnect@$MSOLDomain"
<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>

break

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# Step 3: Configure the Active Directory User Principal Name
#Add new UPN Domain name to on-premises Active Directory 
    $LocalADDomain = "copr.alpineskihouse.com"
    $PublicDomainName = 'emsforcsp.com'
    Set-ADForest -identity "$LocalADDomain" -UPNSuffixes @{Add="$PublicDomainName "}
# Add new UPN to cloud users
    $CloudUserPath = 'OU=Cloud Users,OU=Users,OU=AlpineSkiHouse,DC=corp,DC=AlpineSkiHouse,DC=com'
    Get-ADUser -SearchBase $CloudUserPath -Filter * | ForEach-Object -Process {
        $NewUPN = $PSItem.UserPrincipalName.Replace ($LocalADDomain,$PublicDomainName)
        $PSItem | Set-ADUser -UserPrincipalName $NewUPN -EmailAddress $NewUPN
    }
<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>



<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# Step 7:  Enable Device Writeback Feature
Import-Module 'C:\Program Files\Microsoft Azure Active Directory Connect\AdPrep\AdSyncPrep.psm1'
Initialize-ADSyncDeviceWriteback –AdConnectorAccount svc_aadconnect
