REM @echo off

set scriptFileName=%~n0
set scriptFolderPath=%~dp0
set powershellScriptFileName=%scriptFileName%.ps1
echo %powershellScriptFileName%


PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%scriptFolderPath%\%powershellScriptFileName%'"
pause