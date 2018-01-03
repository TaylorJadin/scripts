# Uninstalls app packages under the 'Active Uninstalls' list. You can also copy items from the Unused uninstall identifiers list and uncomment the line.

# Active Uninstalls
$Packages = (
		'Microsoft.3DBuilder', # '3DBuilder' app
		'Microsoft.CommsPhone', # 'Phone' app
		'Microsoft.ConnectivityStore',
		'Microsoft.Getstarted', # 'Get Started' link
		'Microsoft.Messaging', # 'Messaging' app
		'Microsoft.MicrosoftOfficeHub', 
		'Microsoft.MicrosoftSolitaireCollection', # Solitaire collection
		'Microsoft.Office.OneNote', # Onenote app
		'Microsoft.Office.Sway', # 'Sway' app
		'Microsoft.People', # 'People' app
		'Microsoft.SkypeApp', # 'Get Skype' link
		'microsoft.windowscommunicationsapps', # 'Calendar and Mail' app
		'Microsoft.WindowsPhone', # 'Phone Companion' app
		'Microsoft.XboxApp', # Xbox junk, unfortunately 'Microsoft.XboxGameCallableUI' and 'Microsoft.XboxIdentityProvider' cannot be removed.
		'king.com.CandyCrushSodaSaga', # Candy Crush app
		'9E2F88E3.Twitter' # Twitter app
		)
			
# Unused uninstall identifers
		# 'Microsoft.Appconnector' # Not sure about this one
		# 'Microsoft.BingNews' # Generic News app
		# 'Microsoft.BingFinance', # 'Money' app - Financial news
		# 'Microsoft.BingSports', # 'Sports' app - Sports news
		# 'Microsoft.BingWeather', # 'Weather' app
		# 'Microsoft.WindowsAlarms', # 'Alarms and Clock' app
		# 'Microsoft.Windows.Photos' # Photos app
		# 'Microsoft.WindowsCalculator' # Calculator app
		# 'Microsoft.WindowsCamera' # Camera app
		# 'Microsoft.WindowsMaps' # Maps app
		# 'Microsoft.WindowsSoundRecorder' # Sound Recorder app
		# 'Microsoft.WindowsStore', # Windows Store
		# 'Microsoft.ZuneMusic', # 'Groove Music' app
		# 'Microsoft.ZuneVideo', # Groove Music

Get-AppxPackage –AllUsers | Where-Object Name -In $Packages | Remove-AppxPackage