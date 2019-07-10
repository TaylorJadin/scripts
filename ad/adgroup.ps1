# gets members of an AD group
# also writes out to a csv, uncomment line 8 if you don't want the csv 
$group=$args[0]
$csvpath='.\' + $group + '.csv'

if (!$group) { Write-Host "No argument provided, try somethng like:
.\adgroup.ps1 fa17span101students"; exit }

Get-ADGroupMember $group| Get-ADUser -Property DisplayName,Mail,givenName,surName,employeeNumber | Select Name,DisplayName,Mail,employeeNumber
Get-ADGroupMember $group| Get-ADUser -Property DisplayName,Mail,givenName,surName,employeeNumber | Select Name,DisplayName,Mail,employeeNumber,givenName,surName | Export-csv -path $csvpath -NoTypeInformation