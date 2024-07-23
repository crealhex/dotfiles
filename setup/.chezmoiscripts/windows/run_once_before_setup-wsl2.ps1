if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-File `"$($MyInvocation.MyCommand.Path)`" $($MyInvocation.UnboundArguments)"
        Start-Process -FilePath pwsh.exe -Verb Runas -ArgumentList $CommandLine -Wait
        Exit
    }
}

Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online -NoRestart

wsl --install

wsl --install -d Ubuntu --no-launch

Read-Host -Prompt "Press Enter to exit"