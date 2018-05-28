param (
    [string]$domainName,
    [string]$password,
)


Set-DnsClient -InterfaceAlias "Ethernet*" -ConnectionSpecificSuffix $domainName
    
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

Install-ADDSForest -DomainName $domainName -SafeModeAdministratorPassword $securePassword -Force
