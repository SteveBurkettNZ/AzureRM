﻿break

# Shout out to @brwilkinson for assistance with some of this.


# Install the Azure Resource Manager modules from PowerShell Gallery
# Takes a while to install 28 modules
Install-Module AzureRM -Force -Verbose
Install-AzureRM

# Install the Azure Service Management module from PowerShell Gallery
Install-Module Azure -Force -Verbose

# Import AzureRM modules for the given version manifest in the AzureRM module
Import-AzureRM -Verbose
Import-Module AzureRM

# Import Azure Service Management module
Import-Module Azure -Verbose

# Authenticate to your Azure account
Login-AzureRmAccount

# A number to use as a suffix for everything just to make it unique
$count = 14

# Adjust the '<emslab>' part of these three strings to something unique for you. Leave the last two characters in each.
$URI       = 'https://raw.githubusercontent.com/SteveBurkettNZ/AzureRM/master/active-directory-new-domain-with-data/azuredeploy.json'
$Location  = 'West US'
$rgname    = 'emslab'+ $count + 'rg'
$saname    = 'emslab'+ $count + 'sa'     # Lowercase required
$addnsName = 'emslab'+ $count + 'ad'     # Lowercase required
$w10dnsName = 'emslab'+ $count + 'w10'

# Check that the public dns $addnsName is available
if (Test-AzureRmDnsAvailability -DomainNameLabel $addnsName -Location $Location)
{ 'Available' } else { 'Taken. addnsName must be globally unique.' }

# Create the new resource group. Runs quickly.
New-AzureRmResourceGroup -Name $rgname -Location $Location

# Parameters for the template and configuration


$MyParams = @{
    newStorageAccountName = $saname
    location              = 'West US'
    domainName            = 'corp.adventureworkscycles.com'
    addnsName             = $addnsName +  $count
    w10dnsName            = $w10dnsName + $count 
    virtualNetworkName    = 'adVNET' + $count
    adSubnetName          = 'adSubnet' + $count
    adNicName             = 'adNic' + $count
    w10NicName            = 'w10Nic' + $count
    adNicIPAddress        = '10.0.0.' + $count
    w10NicIPAddress       = '10.0.0.' + ($count+10)
    publicIPAddressName   = 'adpublicIP' + $count
    w10publicIPAddressName = 'w10publicIP' + $count    
    adVMName              = 'adDC' + $count
    w10VMName             = 'w10DC' + $count   
    adAvailabilitySetName = 'adAvailabilitySet' + $count
    w10AvailabilitySetName = 'w10AvailabilitySet' + $count
 }


# Splat the parameters on New-AzureRmResourceGroupDeployment  
$SplatParams = @{
    TemplateUri             = $URI 
    ResourceGroupName       = $rgname 
    TemplateParameterObject = $MyParams
    Name                    = 'AdventureWorksCyclesForest'
   }

# This takes ~30 minutes
# One prompt for the domain admin password
New-AzureRmResourceGroupDeployment @SplatParams -Verbose

# Find the VM IP and FQDN
$PublicAddress = (Get-AzureRmPublicIpAddress -ResourceGroupName $rgname)[0]
$PublicAddressw10 = (Get-AzureRmPublicIpAddress -ResourceGroupName $rgname)[1]
$IP   = $PublicAddress.IpAddress
$FQDN = $PublicAddress.DnsSettings.Fqdn
$IPw10   = $PublicAddressw10.IpAddress
$FQDNw10 = $PublicAddressw10.DnsSettings.Fqdn

# RDP either way
Start-Process -FilePath mstsc.exe -ArgumentList "/v:$FQDN"
Start-Process -FilePath mstsc.exe -ArgumentList "/v:$FQDNw10"
Start-Process -FilePath mstsc.exe -ArgumentList "/v:$IP"
Start-Process -FilePath mstsc.exe -ArgumentList "/v:$IPw10"
break

# Login as:  adventureworkscycles\adadministrator
# Use the password you supplied at the beginning of the build.

# Delete the entire resource group when finished
Remove-AzureRmResourceGroup -Name $rgname -Force -Verbose

