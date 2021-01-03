Set-ExecutionPolicy Bypass;
Write-Host "script root: $PSScriptRoot";

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   

    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments
    break
}

# Dev
choco install -y "$PSScriptRoot\dev\atom.config"
choco install -y "$PSScriptRoot\dev\c_and_cpp.config"
choco install -y "$PSScriptRoot\dev\git.config"
choco install -y "$PSScriptRoot\dev\python.config"
choco install -y "$PSScriptRoot\dev\tools.config"
choco install -y "$PSScriptRoot\dev\vm.config"
choco install -y "$PSScriptRoot\dev\web.config"
choco install -y "$PSScriptRoot\dev\go.config"
choco install -y "$PSScriptRoot\dev\dot_net.config"


Write-Host -NoNewLine "Press any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");