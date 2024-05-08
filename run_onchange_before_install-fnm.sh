#!/bin/bash

source "$(chezmoi source-path)/if-missing-utility.sh"

# Install fnm (Fast Node Manager)
# More information: https://github.com/Schniz/fnm
install_if_missing "fnm" "Fast Node Manager" "curl -fsSL https://fnm.vercel.app/install | bash"

echo "Setup completed successfully"
