set progress description to "A simple progress indicator"
set progress additional description to "Preparing…"
set progress total steps to -1

delay 5

set progress total steps to 100
repeat with i from 1 to 100
	try
		set progress additional description to "I am on step " & i
		set progress completed steps to i
		delay 0.2
	on error thisErr
		display alert thisErr
		exit repeat
	end try
end repeat