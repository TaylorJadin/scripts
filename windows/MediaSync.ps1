<#
.Synopsis
    Renames Downloaded Movies and TV Shows, and sorts to their proper folders in their respective libraries.
    After organizing, sync new files out to my NAS
.Notes
    Created by jadin.taylor@gmail.com
    Moves files from a Downloads directory to a local library directory, then finally copies those over to a network share.
    This script assumes you want to have a "TV Shows" and "Movies" folder in all three places. If not, too bad, write your own damn script. Or just change this one I guess.
#>

#Set various paths here!
$downloadsFolder = 'C:\Users\jadin\Downloads'
$localLibrary = 'C:\Users\jadin\Google Drive\Videos'
$nasShare = '\\WDMYCLOUD\media'
$nasLetter = 'Y:'

#Allow for Recyling of files instead of just deletion
Add-Type -AssemblyName Microsoft.VisualBasic

#Delete those stupid .nfo files
get-childitem $downloadsFolder -include *.nfo -recurse | rm

#Check if directory exists and has files, rename files using filebot, and organize the TV Shows library
$tvDownloads = ($downloadsFolder + '\TV Shows')
$tvLibrary = ($localLibrary + '\TV Shows')

echo "Organizing TV Shows found in:"
echo "$tvDownloads"
echo ""

$testPath = $null
$testPath = Test-Path ($tvDownloads + '\*')
if ($testPath -eq $True) {
  #Get rid of annoying .nfo files that filebot for some reason matches as if they were video files
  rm -r ($tvDownloads + '\*.nfo')
  #this filebot command uses $localLibrary because "--format {plex} will automatically add a "TV Shows" folder
  filebot -rename -non-strict -r $tvDownloads --db TheTVDB --action move --conflict override --output $localLibrary --format '{plex}'
  #Recycle TV Shows folder when finished
  [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($tvDownloads,'OnlyErrorDialogs','SendToRecycleBin')
}
else {
  echo "TV Shows folder is either empty or it does not exist. Moving on."
}

#Check if directory exists and has files, rename files using filebot, and organize the Movies library
$movieDownloads = ($downloadsFolder + '\Movies')
$movieLibrary = ($localLibrary + '\Movies')

echo ""
echo "Organizing Movies found in:"
echo $movieDownloads
echo ""

$testPath = $null
$testPath = Test-Path ($movieDownloads + '\*')
if ($testPath -eq $True) {
  #Get rid of annoying .nfo files that filebot for some reason matches as if they were video files
  rm -r ($movieDownloads + '\*.nfo')
  filebot -rename -non-strict -r $movieDownloads --db TheMovieDB --action move --conflict override --output $movieLibrary
  #Recyle Movies folder when finished
  [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($movieDownloads,'OnlyErrorDialogs','SendToRecycleBin')
}
else {
  echo "Movies folder is either empty or it does not exist. Moving on."
}

#Mount NAS

$testPath = $null
$testPath = Test-Path $nasLetter
if ($testPath -eq $False) {
  echo ""
  echo "Mounting $nasShare to $nasLetter"
  net use $nasLetter $nasShare >$null 2>&1
}
else {
  echo ""
  echo "$nasLetter already mounted."
  echo "Unmounting and remounting $nasShare to $nasLetter to ensure data is being written to the correct network share."

  net use /delete $nasLetter >$null 2>&1
  net use $nasLetter $nasShare >$null 2>&1
}

#Sync over Video libraries to NAS
$tvNAS = ($nasLetter + '\TV Shows')
$moviesNAS = ($nasLetter + '\Movies')

echo ""
echo "Syncing TV Shows"

robocopy $tvLibrary $tvNAS /mir /r:0 /xjd /xf *.ini

echo ""
echo "Syncing Movies"

robocopy $movieLibrary $moviesNAS /mir /r:0 /xjd /xf *.ini
