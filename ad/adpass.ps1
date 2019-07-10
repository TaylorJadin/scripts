# Searches by samaccountnameldcards, accepts wildcards
# after search asks for a password to set for all the accounts it displayed in its search
# Example: jadi*

$query=$args[0]
if (!$query) { Write-Host "No argument provided, try somethng like:
.\adpass.ps1 00test*"; exit }
get-aduser -filter {samaccountname -like $query} -Property DisplayName,Mail | Select samaccountname,DisplayName,Mail
Echo ""
Echo "Preparing to change the password for the accounts listed above. I'd suggest you give them a once over before continuing."
Echo ""
$pwd = Read-Host "Enter desired password" -AsSecureString
Echo ""
get-aduser -filter {samaccountname -like $query} -Property DisplayName,Mail | Set-ADAccountPassword -NewPassword $pwd -reset -PassThru
