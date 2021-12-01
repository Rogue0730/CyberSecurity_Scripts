@ECHO OFF

SET /P doStart=Enter 1 to start or 2 to quit: 
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
net accounts /lockoutdurations:30
net accounts /lockoutwindow:30
echo Account Lockout Policies Completed

sc config msftpsvc start= disabled
sc stop msftpsvc
sc config iprip start= disabled
sc stop iprip
sc config iisadmin start= disabled
sc stop iisadmin
echo Disabled Unnecessary Services

net user guest /active:no
echo Disable guest account

net start "DHCP"
@echo on
echo Y
@echo OFF
echo Started Internet Services

net share C$ /delete
echo Stopped Sharing of Files

rem Powershell.exe -executionpolicy remotesigned -File  /Windows10/levelTwo.ps1

echo $$FINISHED$$
echo Please close this window . . . 

:end
echo Done . . . 
