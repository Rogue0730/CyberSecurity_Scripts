@ECHO OFF

SET /P doStart=Enter 1 to start automation: 
IF %doStart%==1 GOTO :startAutomation 
GOTO :end


:startAutomation
echo Starting . . .
cls

netsh advfirewall set allprofiles state on
echo Enabled Firewall

net accounts /MINPWLEN:8
net accounts /MAXPWAGE:90
net accounts /MINPWAGE:10
net accounts /UNIQUEPW:10
echo Password Policies Completed

net accounts /lockoutthreshold:10
net accounts /lockoutduration:30
echo Account Lockout Policies Completed

net stop msftpsvc
echo Stopped Unnessacry Services

net user guest /active no
echo Disabled Guest Account

:end
echo Please close this window . . . 

pause
