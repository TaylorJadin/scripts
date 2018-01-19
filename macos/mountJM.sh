# This script first switches to the currently logged in user, then runs an applescript to mount the J and M Drives
# Taylor Jadin (2016)

#Get IP Address
ipaddr=`curl -s http://www.snc.edu/ip/only/`
classc=`echo $ipaddr | cut -d'.' -f1-2`
if [ "$classc" = "138.74" ]
	then
	echo "You are on campus. Mounting J and M Drives..."
	# Discover logged in user and run AppleScript code as currently logged in user
	user=`stat -f%Su /dev/console`
	sudo -u $user /usr/bin/osascript <<EndMigration
		-- Mount J-Drive based on OS Version, 10.11 and above plays nice with DFS, older versions do not
		set osVersion to do shell script "sw_vers -productVersion"
		if osVersion > "10.10.5" then
			mount volume "smb://dfs.snc.edu/J-Departments"
		else
			mount volume "smb://macdrives.snc.edu/J-Departments"
		end if

		-- Mount M-Drive
		try
			mount volume "smb://mdrive.snc.edu/Users"
		end try
EndMigration
	echo "Done."

	else
		echo "You are not on campus. Exitting."
	fi
	exit
