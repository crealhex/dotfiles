$msys2Url = "https://api.github.com/repos/msys2/msys2-installer/releases"
$releaseInfo = Invoke-RestMethod -Uri $msys2Url -Headers @{ "User-Agent" = "PowerShell" }

$asset = $releaseInfo.assets | Where-Object { $_.name -match "msys2-x86_64-[0-9]{8}\.exe$" } | Select-Object -First 1
$assetUrl = $asset.browser_download_url

$msys2Installer = "$env:USERPROFILE\Downloads\msys2-x86_64-latest.exe"
Invoke-WebRequest -Uri $assetUrl -OutFile $msys2Installer

$msys2RootPath = "$env:USERPROFILE/Toolkit/msys64"

Write-Host "Installing Msys2..."
$installerArgs = "in --confirm-command --accept-messages --root $msys2RootPath"
Start-Process -FilePath $msys2Installer -ArgumentList $installerArgs -Wait
Remove-Item $msys2Installer

Write-Host "Setting up some files before finishing..."
Copy-Item -Path "$msys2RootPath\home\$env:USERNAME\.profile" -Destination "$env:USERPROFILE\" -Force
