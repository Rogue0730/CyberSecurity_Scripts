@ECHO OFF

CHOICE /c doStart /m Enter "1" to start:

IF ERRORLEVEL == 1 goto StartAutomation

:StartAutomation
echo Starting Automation . . .
Rem -- vv End of Function vv --
exit /b
