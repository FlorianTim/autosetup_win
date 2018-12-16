Set-ExecutionPolicy Bypass;
Write-Host "script root: $PSScriptRoot";

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   

    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments
    break
}

# standard
choco upgrade -y "$PSScriptRoot\standard\browser.config"
choco upgrade -y "$PSScriptRoot\standard\com.config"
choco upgrade -y "$PSScriptRoot\standard\foto.config"
choco upgrade -y "$PSScriptRoot\standard\mail.config"
choco upgrade -y "$PSScriptRoot\standard\media.config"
choco upgrade -y "$PSScriptRoot\standard\office.config"
choco upgrade -y "$PSScriptRoot\standard\tools.config"
choco upgrade -y "$PSScriptRoot\standard\system.config"

Write-Host -NoNewLine "Press any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");