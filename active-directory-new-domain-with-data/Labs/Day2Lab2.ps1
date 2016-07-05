$MSOLDomain = 'mod411530.onmicrosoft.com'


# To connect to Azure Active Directory
$msolcred = get-credential
connect-msolservice -credential $msolcred

# Create Service Account for Azure AD Connect
New-MsolUser -UserPrincipalName "SVC_AADConnect@$MSOLDomain" -DisplayName SVC_AADConnect -FirstName SVC_AADConnect -PasswordNeverExpires $True
Add-MsolRoleMember -RoleName "Company Administrator" -RoleMemberEmailAddress "SVC_AADConnect@$MSOLDomain"

#Add new UPN Domain name, change all users to new UPN. 
$PublicDomainName = 'emsforcsp.com'

Set-ADForest -identity "$MSOLDomain" -UPNSuffixes @{Add="$PublicDomainName "}

$CloudUsers = 'OU=Cloud Users...'

Get-ADUser -SearchBase $CloudUsers -Filter * | ForEach-Object -Process {
    $NewUPN = $PSItem.UserPrincipalName.Replace ($MSOLDomain,$PublicDomainName)
    $PSItems | Set-ADUser -UserPrincipalName $NewUPN -EmailAddress $NewUPN
}

# Enable Device Writeback Feature
Import-Module 'C:\Program Files\Microsoft Azure Active Directory Connect\AdPrep\AdSyncPrep.psm1'
Initialize-ADSyncDeviceWriteback –AdConnectorAccount svc_aadconnect

