@echo off
color a
cls
color b


:::  _____.__               .__             ____ 
:::_/ ____\  |  __ __  _____|  |__   ___  _/_   |
:::\   __\|  | |  |  \/  ___/  |  \  \  \/ /|   |
::: |  |  |  |_|  |  /\___ \|   Y  \  \   / |   |
::: |__|  |____/____//____  >___|  /   \_/  |___|
:::      made by didstanator
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A                   



pause
sfc /scannow
powercfg -h off
echo Cleaning Temporary Files and Cache...

del /q /f /s %TEMP%\*

echo Temporary files and cache cleaned.

echo Disabling Windows Animations and Visual Effects...

:: Disable animations in Windows

:: Disable menu animations (transitions when opening menus)
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f

:: Set performance settings to "Best Performance" (disables most visual effects)
reg add "HKCU\Control Panel\Desktop" /v "VisualFXSetting" /t REG_DWORD /d "2" /f

:: Disable the smooth scrolling effect
reg add "HKCU\Control Panel\Desktop" /v "SmoothScroll" /t REG_SZ /d "0" /f

:: Disable taskbar thumbnail previews
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f

:: Disable animations in the Start menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableAnimations" /t REG_DWORD /d "1" /f

:: Apply the changes (to immediately affect the system)
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Animations have been disabled.
echo Disabling Fast Startup...

powercfg -h off
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

echo Fast Startup disabled.

Fsutil behavior query disabledeletenotify
netsh winsock reset
ipconfig /flushdns
echo Flushing DNS cache...
echo DNS cache flushed.
ping localhost
netsh Winsock reset
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo applied sucessfully!

net stop wuauserv
net stop bits
del /f /s /q %windir%\SoftwareDistribution\Download\*.*
net start wuauserv
net start bits
netsh int ip reset
del /q /f /s %TEMP%\*
netsh interface tcp set global autotuninglevel=disabled

cls
color A

@echo off
echo.                               __  _                                                __     __       __
echo.  ____  ____  ___  _________ _/ /_(_)___  ____  _____   _________  ____ ___  ____  / /__  / /____  / /
echo./ __ \/ __ \/ _ \/ ___/ __ `/ __/ / __ \/ __ \/ ___/  / ___/ __ \/ __ `__ \/ __ \/ / _ \/ __/ _ \/ / 
echo./ /_/ / /_/ /  __/ /  / /_/ / /_/ / /_/ / / / (__  )  / /__/ /_/ / / / / / / /_/ / /  __/ /_/  __/_/  
echo.\____/ .___/\___/_/   \__,_/\__/_/\____/_/ /_/____/   \___/\____/_/ /_/ /_/ .___/_/\___/\__/\___(_)   
echo.    /_/                                                                  /_/                          
echo.

pause                                                                                                                  

pause>nul
