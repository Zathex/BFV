@echo off
bfv.exe
test&cls

>nul 2>&1 "%SYSTEMROOT%\system32\caCLS.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    GOTO UACPrompt
) ELSE ( GOTO gotAdmin )
:UACPrompt
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    SET params = %*:"="
    ECHO UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    DEL "%temp%\getadmin.vbs"
    exit /B
:gotAdmin

python BFV.py
pause