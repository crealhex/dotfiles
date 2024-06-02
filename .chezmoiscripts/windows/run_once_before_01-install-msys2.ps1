$msys2Url = "https://api.github.com/repos/msys2/msys2-installer/releases"
$releaseInfo = Invoke-RestMethod -Uri $msys2Url -Headers @{ "User-Agent" = "PowerShell" }

$asset = $releaseInfo.assets | Where-Object { $_.name -match "msys2-x86_64-[0-9]{8}\.exe$" } | Select-Object -First 1
$assetUrl = $asset.browser_download_url

$msys2Installer = "$env:USERPROFILE\Downloads\msys2-x86_64-latest.exe"
Write-Host "Downloading last Msys2 version..."
Invoke-WebRequest -Uri $assetUrl -OutFile $msys2Installer

Write-Host "Installing Msys2..."
$env:MSYS2ROOT = "$env:USERPROFILE\Toolkit\msys64"

$installerArgs = "in --confirm-command --accept-messages --root $env:MSYS2ROOT"
Start-Process -FilePath $msys2Installer -ArgumentList $installerArgs -Wait

# Just check if the file does exist, I don't want errors
$dotProfile = "$env:MSYS2ROOT\home\$env:USERNAME\.profile"
if (Test-Path -Path $dotProfile) {
  Copy-Item -Path $dotProfile -Destination "$env:USERPROFILE\" -Force
}

Write-Host "Cleaning Up..."
Remove-Item $msys2Installer
Remove-Item -Path "$env:MSYS2ROOT\home\$env:USERNAME\*" -Recurse -Force

if (Test-Path -Path $env:MSYS2ROOT) {
  [System.Environment]::SetEnvironmentVariable(
    "MSYS2ROOT",
    $env:MSYS2ROOT,
    [System.EnvironmentVariableTarget]::User
  )
}

function Launch-BashCommand {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$true)]
    [string]$BashCommand
  )

  $args = @(
    '-defterm',
    '-here',
    '-no-start',
    '-ucrt64',
    '-c'
  )

  Start-Process -FilePath "$env:MSYS2ROOT\msys2_shell.cmd" -ArgumentList ($args + "`"$BashCommand`"") -Wait
}

Launch-BashCommand 'pacman -Syu --noconfirm'
Launch-BashCommand 'pacman -Su --noconfirm'
