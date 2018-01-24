-- Script that downloads join.me and launches it or opens a web browser to connect to an existing join.me session
-- Taylor Jadin  2016

display dialog "This tool will let you share you screen, or view another person's screen they would like to share with you." buttons {"Share My Screen", "View a Shared Screen", "Cancel"} cancel button 3 with title "Screen Sharing" with icon note

-- Share My Screen
if result = {button returned:"Share My Screen"} then
	-- Display dialog
	display dialog "Ater clicking Continue, you will see a program open at the top of your screen with a 9 digit code. Share this 9 didigt code with the person asking to see your screen." buttons {"Continue"} default button 1 with title "Screen Sharing"
	
	-- Check if already downloaded, if exists, launch app and exit
	tell application "Finder"
		if exists file "Macintosh HD:tmp:join.me.app" then
			do shell script "open /tmp/join.me.app"
			return
		end if
	end tell
	
	-- Download app, unzip and launch
	-- Clean up any leftovers
	do shell script "rm -rf /tmp/join.me*"
	
	-- Download .zip and display progress
	do shell script "curl -L -J -A 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.84 Safari/537.36' -o /tmp/join.me.zip https://secure.join.me/Download.aspx > /tmp/status 2>&1 &"
	set fileSize to 0
	set curTransferred to 0
	set curProgress to 0
	repeat until curProgress = "100"
		try
			set lastLine to paragraph -1 of (do shell script "cat /tmp/status")
			set curProgress to word 1 of lastLine
			set fileSize to word 2 of lastLine
			set curTransferred to word 4 of lastLine
			tell me
				display dialog "Downloading. Please wait...
			 " & curTransferred & " of " & fileSize & " (" & curProgress & "%)" buttons {"Cancel"} giving up after 2
				if the button returned of the result is "cancel" then return
			end tell
		end try
	end repeat
	do shell script "open -a 'Archive Utility' /tmp/join.me.zip"
	tell application "Finder"
		repeat while (file "Macintosh HD:tmp:join.me.app" exists) = false
		end repeat
	end tell
	do shell script "open /tmp/join.me.app"
	tell application "Finder" to close front window
	return
end if

-- View a Shared Screen
-- Ask user for 9 digit code, open join.me page with corresponding code
try
	display dialog "Enter 9 digit code from the user who is current sharing their screen:" default answer "" with title "Screen Sharing"
	set idNum to text returned of result
	do shell script "open http://join.me/" & idNum
	return
end try
