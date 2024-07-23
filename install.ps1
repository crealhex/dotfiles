Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install main/pwsh
scoop install main/chezmoi

chezmoi init --verbose --apply crealhex