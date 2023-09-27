# Administratorrechte anfordern
Start-Process -Verb runas -FilePath "powershell" -ArgumentList "-Command CheckAndInstallChocolatey"

function CheckAndInstallChocolatey {
    $isChocoInstalled = $null -ne (Get-Command choco -ErrorAction SilentlyContinue)
    if (-not $isChocoInstalled) {
        Set-ExecutionPolicy Bypass -Scope Process -Force;
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
        iex ((Invoke-WebRequest -UseBasicParsing -Uri 'https://chocolatey.org/install.ps1').Content)
    }


    # Überprüfen, ob die Installation erfolgreich war
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Chocolatey wurde erfolgreich überprüft und installiert."

        # Aufrufen des install_standard.ps1 Skriptes
        .\install_standard.ps1
    }
    else {
        Write-Host "Es gab ein Problem bei der Überprüfung oder Installation von Chocolatey."
    }
}