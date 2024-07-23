Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online -NoRestart

wsl --install

wsl --install Ubuntu --no-launch