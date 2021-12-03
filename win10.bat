@ECHO OFF

SET /P doStart=Press Enter To Start . .  .

rem ---Password Policy---
net accounts /UNIQUEPW:10
net accounts /MAXPWAGE:90
net accounts /MINPWAGE:10
net accounts /MINPWLEN:12

rem ---Lockout Policy---
net accounts /lockoutduration:30
net accounts /lockoutthreshold:10
net accounts /lockoutwindow:30

rem ---Firewall---
netsh advfirewall set allprofiles state on

rem ---Shared Folders---
net share C$ /delete

rem ---User Account Control---
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f


rem ---Window Features---
Dism /online /Disable-Feature /FeatureName:TelnetClient
Dism /online /Disable-Feature /FeatureName:SNMP
Dism /online /Disable-Feature /FeatureName:ServicesForNFS-ClientOnly

rem ---Window Services---
sc config ftpsvc start= disabled
sc stop ftpsvc
sc config upnphost start= disabled
sc stop upnphost
sc config tlntsvr start= disabled
sc stop tlntsvr
sc config SNMPTRAP start= disabled
sc stop SNMPTRAP
sc config Wecsvc start= demand
sc start Wecsvc
sc config RemoteRegistry start= disabled
sc stop RemoteRegistry
sc config iprip start= disabled
sc stop iprip
sc config SNMP start= disabled
sc stop SNMP
sc config iphlpsvc start= disabled
sc stop iphlpsvc

rem --Guest Account--
net user guest /active:no
