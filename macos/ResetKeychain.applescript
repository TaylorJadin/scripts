do shell script "rm -Rf /Users/$USER/Library/Keychains/*"
display dialog "Your computer will now need to restart. Click OK to continue."
tell application "Finder"
    restart
end tell
