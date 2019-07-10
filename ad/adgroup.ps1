# gets members of an AD group
# uncomment lines 6 and 8 to write out a csv; haven't tested this too much
$group=$args[0]
if (!$group) { Write-Host "No argument provided, try somethng like:
.\adgroup.ps1 fa17span101students"; exit }
# $csvpath="C:\Users\taylor\Desktop"
Get-ADGroupMember $group| Get-ADUser -Property DisplayName,Mail,givenName,surName,employeeNumber | Select Name,DisplayName,Mail,employeeNumber
# Get-ADGroupMember $group| Get-ADUser -Property DisplayName,Mail,givenName,surName,employeeNumber | Select Name,DisplayName,Mail,employeeNumber,givenName,surName | Export-csv -path $csvpath -NoTypeInformation