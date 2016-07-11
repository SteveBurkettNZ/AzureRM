<# EMS for CSP Course : Day 2 Lab 1

    Onboarding New Clients into EMS
    
    Reference: Azure Active Directory Cmdlets
    https://technet.microsoft.com/en-ca/library/jj151815.aspx
#>

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# Step 4: Bulk add users via PowerShell from provided .CSV file
# Import the Azure Active Directory for Windows PowerShell Module once installed
    import-module MSOnline
# To connect to Azure Active Directory
    $msolcred = get-credential
    connect-msolservice -credential $msolcred
# Bulk add users to Office 365 from .CSV file
    $NewUsers = Import-Csv -Path C:\Setup\O365-Users.csv
    ForEach($NewUser in $NewUsers){New-MsolUser -UserPrincipalName $NewUser.UserPrincipalName -DisplayName $NewUser.DisplayName -FirstName $NewUser.Firstname -LastName $NewUser.LastName -Password $NewUser.Password -Department $NewUser.Department -UsageLocation $NewUser.Country}
<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>

break

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
# Step 5:  Assign Users EMS and O365 Licenses
# Fetch available License SKU's
    Get-MsolAccountSku 

# Retrieve a list of users to assign licenses to from .CSV file
    $LicenseUsers = Import-CSV -Path C:\Setup\O365-Users.csv
# Apply EMS Licenses to Our Users
    ForEach($LicenseUser in $LicenseUsers){Set-MsolUserLicense -UserPrincipalName $LicenseUser.UserPrincipalName -AddLicenses MOD411530:EMS}
# Apply Active Directory Premium Licenses to Our Users
    ForEach($LicenseUser in $LicenseUsers){Set-MsolUserLicense -UserPrincipalName $LicenseUser.UserPrincipalName -AddLicenses MOD411530:ENTERPRISEPREMIUM}
<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>

break

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
#Step 6: Create new Delegated and Dynamic Groups

    Set-MsolUserLicense -UserPrincipalName admin1@MOD411530.onmicrosoft.com -AddLicenses MOD411530:ENTERPRISEPREMIUM 

<# -------------------------------------------------------------------------------------------------------------------------------------------------------- #>
 
break
