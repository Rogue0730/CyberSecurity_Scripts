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

net user guest /active:no
echo Disable guest account

rem net start "DHCP"
rem echo Started Internet Services

powershell -Command "powershell -ExecutionPolicy Bypass -File levelTwo.ps1"
echo Enabled User Accout Control (UAC)

net share C$ /delete
echo Stopped Sharing of Files

cd Documents
del /S /Q C:\*.mp4
del /S /Q C:\*.mp3
del /S /Q C:\*.wav  

echo $$FINISHED$$
echo Please close this window . . . 
