#Connect to an Exhange Online PowerShell Session
$User = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $User -Authentication Basic -AllowRedirection
Import-PSSession $Session

#Enable Azure RMS on Exchange Online
Set-IRMConfiguration -RMSOnlineKeySharingLocation "https://sp-rms.na.aadrm.com/TenantManagement/ServicePartner.svc"
Import-RMSTrustedPublishingDomain -RMSOnline -name "RMS Online"
Set-IRMConfiguration -InternalLicensingEnabled $True
break
#Confirm that RMS is enabled
Test-IRMConfiguration -RMSOnline

