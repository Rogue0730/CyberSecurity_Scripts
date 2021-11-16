@ECHO OFF

:automationProcess
echo Error
Rem -- vv End of Function vv --
exit /b


Rem User input to initalize automation

SET /P startProcess=Enter "START" to start the process: 

IF %startProcess%==START (call:automationProcess) ELSE (echo Process not started. . .)

