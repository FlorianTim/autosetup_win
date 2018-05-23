REM @echo off

set scriptFileName=%~n0
set scriptFolderPath=%~dp0
set powershellScriptFileName=%scriptFileName%.ps1
echo %powershellScriptFileName%


REM PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command "cd %scriptFolderPath%; & .\%powershellScriptFileName%' -Verb RunAs}"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%scriptFolderPath%\%powershellScriptFileName%'"


REM PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './%powershellScriptFileName%' -Verb RunAs"


REM powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -NoExit -Command `\"cd \`\"C:\`\";"


REM powershell -Command "Start-Process powershell \"-ExecutionPolicy Bypass -NoProfile -NoExit -Command `\"cd \`\"%scriptFolderPath%\`\"; & \`\".\%powershellScriptFileName%\`\"`\"\" -Verb RunAs"
pause