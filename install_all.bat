REM @echo off

set scriptFileName=%~n0
set scriptFolderPath=%~dp0
set powershellScriptFileName=%scriptFileName%.ps1
echo %powershellScriptFileName%
set standartPackeges=install_standard.ps1
set devPackeges=install_dev.ps1



PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%scriptFolderPath%\%standartPackeges%'"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%scriptFolderPath%\%devPackeges%'"
pause