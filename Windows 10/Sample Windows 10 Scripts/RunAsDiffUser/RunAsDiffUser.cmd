reg.exe load HKEY_LOCAL_MACHINE\defuser c:\users\default\ntuser.dat
reg.exe import "RunAsDiffUser\RunAsDiffUser.reg"
reg.exe unload HKEY_LOCAL_MACHINE\defuser