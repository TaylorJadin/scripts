@ECHO OFF
copy y:\Win10_Activate.ps1 %tmp%
PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%tmp%\Win10_ActivateandRemoveApps.ps1""' -Verb RunAs}"