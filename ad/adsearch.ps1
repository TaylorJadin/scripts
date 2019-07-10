# Searches by DisplayName, accepts wildcards
# Example: Taylor*
$query=$args[0]
$csvpath='.\' + $query + '.csv'

if (!$query) { Write-Host "No argument provided, try somethng like:
.\adsearch.ps1 Taylor*"; exit }

get-aduser -filter {DisplayName -like $query} -Property DisplayName,Mail | Select samaccountname,DisplayName,Mail
get-aduser -filter {DisplayName -like $query} -Property DisplayName,Mail | Select samaccountname,DisplayName,Mail | Export-csv -path $csvpath -NoTypeInformation