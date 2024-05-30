$msys2Url = "https://api.github.com/repos/msys2/msys2-installer/releases"
$releaseInfo = Invoke-RestMethod -Uri $msys2Url -Headers @{ "User-Agent" = "PowerShell" }

$asset = $releaseInfo.assets | Where-Object { $_.name -match "msys2-x86_64-[0-9]{8}\.exe$" } | Select-Object -First 1
$assetUrl = $asset.browser_download_url

$outputPath = "C:\Users\Warender\Downloads\msys2-x86_64-latest.exe"
Invoke-WebRequest -Uri $assetUrl -OutFile $outputPath

Write-Host "Installing Msys2..."
$installerArgs = "in --confirm-command --accept-messages --root C:/Users/Warender/Toolkit/msys64"
Start-Process -FilePath $outputPath -ArgumentList $installerArgs -Wait

Remove-Item $outputPath