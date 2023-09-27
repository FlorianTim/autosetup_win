Set-ExecutionPolicy Bypass;
Write-Host "script root: $PSScriptRoot";
$modus=$args[0]
$selection=$args[1]



If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   

    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments
    break
}

# Games
choco install -y "$PSScriptRoot\dev\atom.config"
choco install -y "$PSScriptRoot\dev\c_and_cpp.config"


Write-Host -NoNewLine "Press any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");