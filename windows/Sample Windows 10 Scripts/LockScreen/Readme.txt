Info: http://www.ohmancorp.com/RefWin-windows8-change-pre-login-screen-background.asp

Method 1 - Specify an image using policy. (I just choose to set the Regkey)

You can statically enter a policy into the registry:
HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization
 Key: LockScreenImage (REG_SZ), Value: C:\Windows\Web\Screen\YourCustomImage.png
 The file does not need to be in the Screen directory, you can specify any valid path and filename.
