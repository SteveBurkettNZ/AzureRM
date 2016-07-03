# Reference: Azure Active Directory Cmdlets
#            https://technet.microsoft.com/en-ca/library/jj151815.aspx


# To import the Azure Active Directory for Windows PowerShell Module once installed
import-module MSOnline

# To connect to Azure Active Directory
$msolcred = get-credential
connect-msolservice -credential $msolcred

# Bulk add users from CSV
$NewUsers = Import-Csv -Path .\NewUsers.csv
ForEach($NewUser in $NewUsers){New-MsolUser -UserPrincipalName $NewUser.UserPrincipalName -DisplayName $NewUser.DisplayName -FirstName $NewUser.Firstname -LastName $NewUser.LastName -Password $NewUser.Password -Department $NewUser.Department -UsageLocation $NewUser.UsageLocation}

# Bulk License Users from CSV
$LicenseUsers = Import-CSV -Path .\LicenseUsers.csv

# Fetch SKU
# $SKU = Get-MsolAccountSku 

# Apply Licenses to Users
ForEach($LicenseUser in $LicenseUsers){Set-MsolUserLicense -UserPrincipalName $LicenseUser.UPN -AddLicenses MOD411530:EMS}

