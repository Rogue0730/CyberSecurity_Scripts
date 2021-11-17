@ECHO OFF

SET /P doStart=Enter 1 to start automation: 
IF %doStart%==1 GOTO :startAutomation 
GOTO :end


:startAutomation
echo Starting . . .
cls

netsh advfirewall set allprofiles state on
echo Enabled Firewall

net accounts /MINPWLEN:12
net accounts /MAXPWAGE:90
net accounts /MINPWAGE:10
net accounts /UNIQUEPW:10
echo Password Policies Completed

net accounts /lockoutthreshold:10
echo Account Lockout Policies Completed

net stop msftpsvc
echo Stopped Unnessacry Services

cd C:\
del /S /Q C:\*.mp3
del /S /Q C:\*.mp4
echo Remove All Media Files
GOTO :end

:end
echo Please close this window . . . 

pause
