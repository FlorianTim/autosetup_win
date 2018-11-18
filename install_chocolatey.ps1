Set-ExecutionPolicy Bypass;
Write-Host "script root: $PSScriptRoot";

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   

    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments
    break
}


Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Write-Host "script root: $PSScriptRoot";

# standard
choco install -y "$PSScriptRoot\standard\browser.config"
choco install -y "$PSScriptRoot\standard\com.config"
choco install -y "$PSScriptRoot\standard\foto.config"
choco install -y "$PSScriptRoot\standard\mail.config"
choco install -y "$PSScriptRoot\standard\media.config"
choco install -y "$PSScriptRoot\standard\office.config"
choco install -y "$PSScriptRoot\standard\tools.config"

# Dev
choco install -y "$PSScriptRoot\dev\atom.config"
choco install -y "$PSScriptRoot\dev\c_and_cpp.config"
choco install -y "$PSScriptRoot\dev\git.config"
choco install -y "$PSScriptRoot\dev\python.config"
choco install -y "$PSScriptRoot\dev\tools.config"
choco install -y "$PSScriptRoot\dev\vm.config"
choco install -y "$PSScriptRoot\dev\web.config"


Write-Host -NoNewLine "Press any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");