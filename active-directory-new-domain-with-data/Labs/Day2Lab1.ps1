# Reference: Azure Active Directory Cmdlets
#            https://technet.microsoft.com/en-ca/library/jj151815.aspx


# To import the Azure Active Directory for Windows PowerShell Module once installed
import-module MSOnline

# To connect to Azure Active Directory
$msolcred = get-credential
connect-msolservice -credential $msolcred

# Bulk add users from CSV
$NewUsers = Import-Csv -Path C:\Setup\O365UserData.csv
ForEach($NewUser in $NewUsers){New-MsolUser -UserPrincipalName $NewUser.UserPrincipalName -DisplayName $NewUser.DisplayName -FirstName $NewUser.Firstname -LastName $NewUser.LastName -Password $NewUser.Password -Department $NewUser.Department -UsageLocation $NewUser.Country}

break

# Fetch SKU
Get-MsolAccountSku 

## Bulk License Users from CSV
$LicenseUsers = Import-CSV -Path .\LicenseUsers.csv
# Apply EMS Licenses to Our Users
ForEach($LicenseUser in $LicenseUsers){Set-MsolUserLicense -UserPrincipalName $LicenseUser.UPN -AddLicenses MOD411530:EMS}
# Apply Active Directory Premium Licenses to Our Users
ForEach($LicenseUser in $LicenseUsers){Set-MsolUserLicense -UserPrincipalName $LicenseUser.UPN -AddLicenses MOD411530:ENTERPRISEPREMIUM}
