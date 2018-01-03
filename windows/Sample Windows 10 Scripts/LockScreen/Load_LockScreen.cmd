REM Copy Wallpaper locally
xcopy LockScreen\LockWall.jpg C:\Cabs\LockWallpaper\ /Y /S

REM Import Registry Key to set the background
reg import LockScreen\LockScreenWallpaper.reg
reg import LockScreen\LockScreenWallpaper.reg /reg:64
