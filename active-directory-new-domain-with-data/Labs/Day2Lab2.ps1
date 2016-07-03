
#Add new UPN Domain name, change all users to new UPN. 
$LocalDomainName = '****.onmicrosoft.com'
$PublicDomainName = 'emsforcsp.com'

Set-ADForest -identity "$LocalDomainName" -UPNSuffixes @{Add="$PublicDomainName "}

$CloudUsers = 'OU=Cloud Users...'

Get-ADUser -SearchBase $CloudUsers -Filter * | ForEach-Object -Process {
    $NewUPN = $PSItem.UserPrincipalName.Replace ($LocalDomain,$PublicDomainName)
    $PSItems | Set-ADUser -UserPrincipalName $NewUPN -EmailAddress $NewUPN
}
